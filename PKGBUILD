# Maintainer: necklace <ns@nsz.no>

pkgname=avaloniailspy
_gitname="AvaloniaILSpy"
pkgver=v7.2
_gittag=v7.2-rc
pkgrel=2
url="https://github.com/icsharpcode/AvaloniaILSpy"
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
arch=("any")
provides=("avaloniailspy")
license=("MIT" "LGPLv2.1" "Ms-PL")
depends=("dotnet-runtime")
makedepends=("dotnet-sdk" "libicns" "git" "mono")

source=("git+https://github.com/icsharpcode/${_gitname}.git#tag=${_gittag}" 
        "${pkgname}.desktop")
sha256sums=("SKIP"
            "607c64adb67e7d6d54e2d6ca57e5f3b2e68aa4ba80cb745dd9e93b8e86677d26")

prepare() {
  cd ${_gitname}
  #git checkout b83f719460ccfad52bf9f2bf0a5f9ab73bde3cc3
  git submodule update --force --recursive --init
  icns2png -x ILSpy/ILSpy.icns
}

build() {
  cd $srcdir/$_gitname
  #dotnet build --configuration release --output "Release"
  ./build.sh
}

package() { 
  mkdir -p "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${_gitname}/artifacts/linux-x64/" "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/usr/share/${pkgname}/ILSpy" "${pkgdir}/usr/bin/${pkgname}"

  # Licenses
  install -Dm644 "${srcdir}/${_gitname}/doc/license.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/${_gitname}/doc/LGPL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.LGPLv2.1"
  install -Dm644 "${srcdir}/${_gitname}/doc/MS-PL.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE.MSPL"

  # Icon for .desktop
  install -Dm644 "${srcdir}/${_gitname}/ILSpy_256x256x32.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$pkgname.png"

  # .desktop
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}