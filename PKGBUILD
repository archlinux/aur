# Maintainer: NiNjA <heinep@gmail.com>
pkgname=freeserf.net
pkgver=2.1.0
pkgrel=3
pkgdesc='Settlers 1 clone written in C# (requires original game file)'
arch=('x86_64')
url='https://github.com/Pyrdacor/freeserf.net'
license=('GPL3')
depends=('dotnet-runtime-3.1-bin')
makedepends=('git' 'dotnet-sdk' 'dotnet-targeting-pack')
install='freeserf.net.install'
source=("https://github.com/Pyrdacor/freeserf.net/archive/refs/tags/v${pkgver}.tar.gz" 'freeserf.net.install' 'FreeserfNet' 'FreeserfNet.desktop' 'fix_libdl.patch' 'fix_log_directory.patch')
md5sums=('04e6eec26b3717aca6b4d22bfdeb014e'
         'ed08c80955615acd1697a0395d5dff41'
         '3a8c9a0f03a6a526da130d057d9acd56'
         '59a76e9b8f0dfc0acf7ed7ca0927ab58'
         '2bd44c28ccced72c99a307109265a884'
         '316d3bc772637eccb729bd55499e3dd4')

prepare() {
  cd freeserf.net-${pkgver}
  patch -p0 < "${srcdir}"/fix_libdl.patch
  patch -p0 < "${srcdir}"/fix_log_directory.patch
}

build() {
  cd freeserf.net-${pkgver}
  dotnet restore FreeserfNet.sln --verbosity normal
  dotnet msbuild -p:Configuration=LinuxRelease -p:DefineConstants=LINUX FreeserfNet.sln
}

package() {
  cd freeserf.net-${pkgver}
  mkdir -p "${pkgdir}"/usr/share/freeserf.net
  install -Dm644 "${srcdir}"/FreeserfNet.desktop "${pkgdir}"/usr/share/applications/FreeserfNet.desktop
  cp FreeserfNet/bin/LinuxRelease/*.{so,dll,json} FreeserfNet/bin/LinuxRelease/FreeserfNet "${pkgdir}"/usr/share/freeserf.net
  install -Dm755 "${srcdir}"/FreeserfNet "${pkgdir}"/usr/bin/FreeserfNet
  chmod 644 "${pkgdir}"/usr/share/freeserf.net/*.{so,dll,json}
}
