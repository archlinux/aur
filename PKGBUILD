# Maintainer: Nathaniel Cook <nvcook42@gmail.com>

_pkgname='opensprinkler'
pkgname="${_pkgname}-git"
provides=($_pkgname)
pkgver=2.1.7.r16.gbe0369d
pkgrel=4
pkgdesc='Firmware for OpenSprinkler on a Raspberry Pi'
arch=('armv6h')
makedepends=('gcc' 'git' 'patch')
install="${_pkgname}.install"
source=("git+http://github.com/OpenSprinkler/OpenSprinkler-Firmware.git"
        "${_pkgname}.install"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "cwd.patch"
        "gpio.patch")

sha256sums=('SKIP'
            '393d7a6abb15e392c76c61a12d968d834acee5cd5f6c84ae8e420e3b369e20ce'
            '9257108231021eb1963761af5c50ce5333264f1eaea0359ee35f08758c396871'
            '91249b681ea64db4307f07d9d2a6e64a5900426b4185d53067c5e4b3dda02846'
            '27a20bb4716a63ed09499a059e2e3bf69ed127b5aa902df92bfbebb34c1edaf9'
            '89b18ca98c725c46ec0b86a62276ca63ae75ea759668d157f0f11c6b16fce184')
pkgver() {
  cd "OpenSprinkler-Firmware"
  git describe --long --tags | sed 's/\([0-9]\)\([0-9]\)\([0-9]\)-\([0-9]*-g\)/\1.\2.\3.r\4/;s/-/./g'
}

prepare() {
  cd "OpenSprinkler-Firmware"
  patch < ${srcdir}/cwd.patch
  patch < ${srcdir}/gpio.patch
}

build() {
  cd "OpenSprinkler-Firmware"
  g++ -o ${_pkgname} -DOSPI main.cpp OpenSprinkler.cpp program.cpp server.cpp utils.cpp weather.cpp gpio.cpp etherport.cpp -lpthread
}

package() {
  # systemd user and service file
  install -D -m644 "${srcdir}/${_pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -D -m644 "${srcdir}/${_pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"

  # binaries
  install -D -m755 "${srcdir}/OpenSprinkler-Firmware/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
