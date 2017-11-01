# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>
# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

_pkgname=atom
_version=git

pkgname=${_pkgname}-editor-${_version}
pkgver=1.23.0.dev.33610
pkgrel=1
pkgdesc='Hackable text editor for the 21st Century, based on web technologies - git channel.'
arch=('x86_64' 'i686')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs'  'nss' 'python2')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')
install=${_pkgname}-${_version}.install
source=("git+${url}.git"
"${_pkgname}-${_version}.desktop"
"${_pkgname}-${_version}")
sha256sums=('SKIP'
            'b172e3f81eb42eeb1ad6ef70300c33a79a2015110ea87c413b5857c9694d10e9'
            '20d3c386dd60e85977511f9138e32921af051fd7e573d3052822219bd7210be9')

pkgver() {
    cd $srcdir/$_pkgname
    _basever=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g' | sed 's/-/./g')
    _commitno=$(git rev-list --count HEAD)
    printf "${_basever}.${_commitno}"
}

prepare() {
    cd "$srcdir/${_pkgname}"

    sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
    ./script/build || die "Fail fixing verbosity of script/build"
}

build() {
    # Fix : GYP does not support python3 but uses python, not python2
    export PYTHON=/usr/bin/python2
    cd "${srcdir}"
    mkdir -p pypath
    ln -fs /usr/bin/python2 ./pypath/python
    export PATH=$(pwd)/pypath:$PATH

    cd "${srcdir}/${_pkgname}"
    # Cleanup a non-clean srcdir
    rm -f ./apm/package-lock.json ./node_modules/github/node_modules.bak
    ./script/build # use until ./script/build; do :; done instead if network errors occur
}

package() {
    cd "$srcdir/${_pkgname}"

    _ver=$(cat package.json | grep version | sed 's/version//g' | sed 's/://g' | sed 's/ //g' |  sed 's/"//g' | sed 's/,//g')
    _commit=$(git rev-parse --short HEAD)

    _arch=amd64
    if [ "${CARCH}" = "i686" ]; then
         _arch=i386
    fi
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/share/${_pkgname}-${_version}
    install -dm755 ${pkgdir}/usr/share/applications
    install -dm755 ${pkgdir}/usr/share/licenses/$pkgname
    install -dm755 ${pkgdir}/usr/share/pixmaps

    cp -r out/atom-${_ver}-${_commit}-${_arch}/* ${pkgdir}/usr/share/${_pkgname}-${_version}/
    mv ${pkgdir}/usr/share/${_pkgname}-${_version}/atom.png ${pkgdir}/usr/share/pixmaps/${_pkgname}-${_version}.png
    mv ${pkgdir}/usr/share/${_pkgname}-${_version}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $srcdir/${_pkgname}-${_version} ${pkgdir}/usr/bin/${_pkgname}-${_version}
    install -Dm644 $srcdir/${_pkgname}-${_version}.desktop ${pkgdir}/usr/share/applications/${_pkgname}-${_version}.desktop
    rm ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app/atom.sh
    rm -rf ${pkgdir}/usr/share/${_pkgname}-${_version}/resources/app.asar.unpacked/resources
    ln -sf "/usr/share/${_pkgname}-${_version}/resources/app/apm/node_modules/.bin/apm" "${pkgdir}/usr/bin/apm-${_version}"

    find "$pkgdir" \
      -name "*.a" -exec rm '{}' \; \
      -or -name "*.bat" -exec rm '{}' \; \
      -or -name "benchmark" -prune -exec rm -r '{}' \; \
      -or -name "doc" -prune -exec rm -r '{}' \; \
      -or -name "html" -prune -exec rm -r '{}' \; \
      -or -name "man" -prune -exec rm -r '{}' \; \
      -or -path "*/less/gradle" -prune -exec rm -r '{}' \; \
      -or -path "*/task-lists/src" -prune -exec rm -r '{}' \; \
      -or -name "package.json" -exec sed -i -e "s|${srcdir}/atom/apm|/usr/share/${_pkgname}-${_version}/resources/app/apm|g" '{}' +
}
