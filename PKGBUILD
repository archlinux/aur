# Maintainer: NiNjA <heinep@gmail.com>
pkgname=freeserf.net
pkgver=2.2.3
pkgrel=1
pkgdesc='Settlers 1 clone written in C# (requires original game file)'
arch=('x86_64')
url='https://github.com/Pyrdacor/freeserf.net'
license=('GPL3')
makedepends=('git' 'dotnet-sdk' 'dotnet-targeting-pack')
options=(!strip)
install='freeserf.net.install'
source=("https://github.com/Pyrdacor/freeserf.net/archive/refs/tags/v${pkgver}.tar.gz" 'freeserf.net.install' 'FreeserfNet.desktop' 'enable_log.patch' 'fix_version_number.patch')
md5sums=('b5989283e8fd1f4eb42410cba3442faf'
         '85636f36cd19808da4d58317f8c98b8f'
         '59a76e9b8f0dfc0acf7ed7ca0927ab58'
         '4af1619121aa1aeb8081f3054f41aa4c'
         '25cf181af5cd2f70221ac28c41992fc6')

prepare() {
  cd freeserf.net-${pkgver}
  patch -p0 < "${srcdir}"/enable_log.patch
  patch -p0 < "${srcdir}"/fix_version_number.patch
}

build() {
  cd freeserf.net-${pkgver}
  dotnet restore FreeserfNet.sln --verbosity normal
  dotnet publish -c LinuxRelease FreeserfNet/FreeserfNet.csproj -p:DefineConstants=LINUX -p:PublishSingleFile=true -r linux-x64
}

package() {
  local builddir="FreeserfNet/bin/LinuxRelease/linux-x64"
  local targetdir="${pkgdir}"/usr/share/freeserf.net

  # Prepare directories
  mkdir -p "${targetdir}"
  mkdir -p "${pkgdir}/usr/bin"

  # Copy files to target dir
  cd freeserf.net-${pkgver}
  cp "${builddir}"/libbass*.so "${targetdir}"
  cp -r "${builddir}"/publish/* "${targetdir}"

  # Install desktop and binary
  install -Dm644 "${srcdir}"/FreeserfNet.desktop "${pkgdir}"/usr/share/applications/FreeserfNet.desktop
  ln -s "${targetdir}"/FreeserfNet "${pkgdir}"/usr/bin/FreeserfNet
}
