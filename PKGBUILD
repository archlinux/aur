# Maintainer: Reza Jahanbakhshi <reza.jahanbakhshi at gmail dot com
# Co-Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: IanDury <iandury@xs4all.nl>

pkgname=openzwave-git
basename=${pkgname%-git}
pkgver=7528.4887754f.97f47476b8675683144a4278a4c93271
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
license=('LGPL')
depends=('libsystemd')
makedepends=('doxygen' 'git')
conflicts=('openzwave' 'openzwave-svn')
provides=('openzwave')
install="$pkgname.install"
source=(
  "${basename}::git+https://github.com/OpenZWave/open-zwave.git"
  null-check.patch
)
sha256sums=('SKIP'
            'a7d4f12eb5ff3cb29f12a896bf7e0da5c36ea4c5c0d5a77f9bff481b48fc7774')

pkgver() {
    cd "${basename}"

    local _patchver
    local _patchfile
    for _patchfile in "${source[@]}"; do
        _patchfile="${_patchfile%%::*}"
        _patchfile="${_patchfile##*/}"
        [[ $_patchfile = *.patch ]] || continue
        _patchver="${_patchver}$(md5sum ${srcdir}/${_patchfile} | cut -c1-32)"
    done
    _patchver="$(echo -n $_patchver | md5sum | cut -c1-32)"

    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD).${_patchver}
}

prepare() {
  local _patchfile
  for _patchfile in "${source[@]}"; do
    _patchfile="${_patchfile%%::*}"
    _patchfile="${_patchfile##*/}"
    [[ $_patchfile = *.patch ]] || continue
    echo "Applying patch $_patchfile..."
    patch --directory=${basename} --forward --strip=1 --input="${srcdir}/${_patchfile}"
  done
  find ${srcdir}/${basename} -name Makefile | xargs sed -e 's/-Wno-format//' -i
}

build() {
  cd "${basename}"

  if [[ -f cpp/src/vers.cpp ]]
  then
    echo "Removing cpp/src/vers.cpp to ensure version number update."
    rm 'cpp/src/vers.cpp'
  fi

  make
}

package() {
  cd "${basename}"

  make \
    DESTDIR="$pkgdir" \
    PREFIX='/usr' \
    instlibdir='/usr/lib' \
    sysconfdir='/etc/openzwave' \
    install
}

# vim:set ts=2 sw=2 et:
