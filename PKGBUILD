# Maintainer: necklace <ns@nsz.no>

pkgname=avaloniailspy
_gitname="AvaloniaILSpy"
pkgver=v5.0
_gittag=v5.0-rc2
pkgrel=9
url="https://github.com/icsharpcode/AvaloniaILSpy"
pkgdesc="Avalonia-based .NET Decompiler (port of ILSpy)"
arch=("any")
provides=("avaloniailspy")
license=("MIT" "LGPLv2.1" "Ms-PL")
depends=("dotnet-runtime" "dotnet-runtime-3.1")
makedepends=("dotnet-sdk" "libicns" "git")

source=("git+https://github.com/icsharpcode/${_gitname}.git#tag=${_gittag}" 
        "${pkgname}.desktop")
sha256sums=("SKIP"
            "607c64adb67e7d6d54e2d6ca57e5f3b2e68aa4ba80cb745dd9e93b8e86677d26")

prepare() {
  cd ${_gitname}
  git submodule update --force --recursive --init
  git cherry-pick 6095cb6d16a82f3d12cc6347bcc51f9bf9c8c6cc
  icns2png -x ILSpy/ILSpy.icns
}

build() {
  cd $srcdir/$_gitname
  dotnet build --configuration release --output "Release"
}

package() { 
  mkdir -p "${pkgdir}/usr/share/"
  cp -r "${srcdir}/${_gitname}/Release/" "${pkgdir}/usr/share/${pkgname}"
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