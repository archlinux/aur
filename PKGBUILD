# Maintainer: Joffrey Darcq <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname='seahub'
pkgver=6.3.0
pkgrel=1
pkgdesc='The web frontend for seafile server'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('custom:Apache PSF MIT BSD GPL')
depends=("seafile-server>=${pkgver}" 'libmemcached' 'freetype2' 'openjpeg2')
optdepends=('mariadb: For use MySQL databases'
            'memcached: For better caching performance'
            'ffmpeg: For video thumbnails'
)
makedepends=('python2-virtualenv' 'git')
changelog="ChangeLog"
source=("${pkgname}-${pkgver}-server.tar.gz::${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('89b52185ecf6a90417b4c52b4e24fb7af941996b7a9f92875dfc00967719627f')
options=("!strip")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}-server"

    # Add python utils modules to requirements.txt
    {
        echo 'flup'             # WSGI support
        echo 'MySQL-python'     # MySQL support
        echo 'pylibmc'          # Memcached support
        echo 'django-pylibmc'   # Memcached support
    } >> "./requirements.txt"

    # Prepare License
    {
        cat './LICENSE.txt'
        cat './LICENSE-'*
    } >> './LICENSE'

    # Remove useless files and directories
    rm -rf \
        './CONTRIBUTORS' './HACKING' './Makefile' \
        './'{*test*,*dev*,*sh*,README*,pylintrc*,LICENSE[.-]*} \
        "$(find . -name \*.pyc)"

    # Use python lib seahub interpreter for all scripts
    grep -s -l -r '#!/usr/bin/env python' "./" \
    | xargs sed -i -e '1 s|#!/usr/bin/env python|#!/usr/lib/seahub/bin/python2|'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}-server/"

    printf 'Compile seahub locales...'
    for locale in ./locale/*/LC_MESSAGES/*.po; do
        msgfmt -o "${locale%.po}.mo" "${locale}"
    done
    printf 'done.\n'
}

package() {
    cd "${srcdir}/seahub-${pkgver}-server/"

    # Install seahub
    install -dm755 "${pkgdir}/usr/share/seafile-server/seahub" 
    cp -r -p "./"* "${pkgdir}/usr/share/seafile-server/seahub/"

    install -Dm644 './LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create VirtualEnv 
    venv="${pkgdir}/usr/lib/seahub"
    virtualenv2 --no-wheel --system-site-packages "${venv}"

    source "${venv}/bin/activate"  # Activates the VirtualEnv

    # Fix modules missing
    printf 'Installing gunicorn, six...'
    pip2 install --isolated --no-compile --upgrade --force-reinstall 'gunicorn' 'six' > /dev/null
    printf 'done.\n'

    # Install requirements
    pip2 install --isolated --no-compile -r "./requirements.txt"

    deactivate  # Deactivate VirtualEnv

    virtualenv2 --relocatable "${venv}"  # Use relative path

    # Recompile .py for printing valid file paths in case of python exceptions.
    # Requires minimum 1GB RAM, comment next commands in case of < 1GB RAM
    printf "Compile all .py in %s/..." "${venv}/bin"
    python2 -m compileall \
            -q -f -d "${venv#$pkgdir}/bin" \
            -- "${venv}/bin"
    printf 'done.\n'

    # _gaiohttp.py excluded due to https://github.com/benoitc/gunicorn/issues/810
    printf "Compile all .py in %s/..." "${venv}/lib/python2.7"
    python2 -m compileall \
            -q -f -d "${venv#$pkgdir}/lib/python2.7" \
            -x '.*/gunicorn/workers/_gaiohttp.py' \
            -- "${venv}/lib/python2.7"
    printf 'done.\n'
}
