# Maintainer: Joffrey Darcq <j-off@live.fr>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: Edvinas Valatka <edacval@gmail.com>
# Contributor: Aaron Lindsay <aaron@aclindsay.com>

pkgname='seahub'
pkgver=6.2.5
pkgrel=3
pkgdesc='The web frontend for seafile server'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/${pkgname}"
license=('Apache' 'PSF' 'MIT' 'BSD')
depends=('seafile-server' 'libmemcached' 'libmariadbclient')
optdepends=('memcached' 'mariadb')
makedepends=('python2-virtualenv')
install="${pkgname}.install"
changelog="ChangeLog"
source=("${pkgname}-${pkgver}-server.tar.gz::${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('80a7a1cadde8e8e570bdc454bc4a4902ebcace97b347f9eef701b5ab02742039')

prepare () {
    cd "${srcdir}/${pkgname}-${pkgver}-server"

    # Fix all script's python 2 requirement
    grep -s -l -r '#!/usr/bin/env python\b' "./" \
    | xargs sed -i -e '1 s|env python\b|env python2|'

    # Add python utils modules to requirements.txt
    {
        echo 'flup'             # WSGI support
        echo 'MySQL-python'     # MySQL support
        echo 'pylibmc'          # Memcached support
        echo 'django-pylibmc'   # Memcached support
    } >> "./requirements.txt"
}

package() {
    cd "${srcdir}/seahub-${pkgver}-server/"

    # Install seahub
    install -dm755 "${pkgdir}/usr/share/seafile-server/seahub" 
    cp -r -p "./"* "${pkgdir}/usr/share/seafile-server/seahub/"

    # Create VirtualEnv 
    virtualenv="${pkgdir}/usr/lib/seahub"
    virtualenv2 --no-wheel --system-site-packages "${virtualenv}"

    # Activates the VirtualEnv
    source "${virtualenv}/bin/activate"

    # Fix subprocess exception if gunicorn is already installed
    printf 'Installing gunicorn...'
    pip2 install --isolated --no-compile --upgrade --force-reinstall gunicorn > /dev/null && \
    printf 'done.\n'

    # Install requirements
    pip2 install --isolated --no-compile -r "./requirements.txt"
    
    deactivate  # Deactivate VirtualEnv

    # Use relative path
    virtualenv2 --relocatable "${virtualenv}"

    # Recompile all .pyc files in virtualenv.
    # Not stricly required
    # But useful for printing valid source file paths in case of python exceptions.
    # Requires minimum 1GB RAM, comment next two commands in case of < 1GB RAM
    # _gaiohttp.py excluded due to https://github.com/benoitc/gunicorn/issues/810

    printf "Compile all .py in %s/..." "${virtualenv}/bin"
    python2 -m compileall \
            -q -f -d "${virtualenv#$pkgdir}/bin" \
            -- "${virtualenv}/bin" && \
    printf 'done.\n'

    printf "Compile all .py in %s/..." "${virtualenv}/lib/python2.7"
    python2 -m compileall \
            -q -f -d "${virtualenv#$pkgdir}/lib/python2.7" \
            -x '.*/gunicorn/workers/_gaiohttp.py' \
            -- "${virtualenv}/lib/python2.7" && \
    printf 'done.\n'
}
