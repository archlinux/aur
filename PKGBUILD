# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: chendaniely <chendaniely@gmail.com>
# Contributor: Conor Anderson <conor@conr.ca>

pkgname=nteract
pkgver=0.28.0
pkgrel=2
pkgdesc="Interactive literate coding notebook"
url="https://nteract.io/"
arch=("x86_64")
license=("BSD")

depends=("gtk3" "nss" "libxcrypt" "libxcrypt-compat" "ruby" "python")
makedepends=("nodejs" "npm" "yarn")
optdepends=("ihaskell: support for Haskell"
            "sagemath-jupyter: support for SageMath"
            "python-ipykernel: support for Python 3"
            "julia: support for Julia (requires the \"IJulia\" package)"
            "r: support for R (requires the \"IRkernel\" package)")

conflicts=("nteract-bin" "nteract-appimage")
replaces=("${pkgname}")
provides=("${pkgname}")

source=("v${pkgver}.tar.gz::https://github.com/nteract/nteract/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/nteract/nteract/main/LICENSE")

sha256sums=('5132a05ca269aa3b1b0a96cbe4a7b9956454069029173f6f1cb3d73a59a83073'
            '866e6fa48cb8810d36d8d85a3085d7aa1c4317d3731f0ef84919428fee87bf71')

prepare() {
  cd "${srcdir}"

  patch --forward --strip=1 < ../package.patch 
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  NODE_OPTIONS="--max-old-space-size=8192" yarn
  NODE_OPTIONS="--max-old-space-size=8192" yarn verifyBeforePublish
  NODE_OPTIONS="--max-old-space-size=8192" yarn dist:linux
  NODE_OPTIONS="--max-old-space-size=8192" yarn ship:desktop
}

package() {
  install -Dm 644 "LICENSE" 		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "${pkgname}.desktop"	"${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/applications/desktop/static/icon.png"		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/applications/desktop/dist/linux-unpacked"	"${pkgdir}/opt/${pkgname}"
  
  chmod u+s "${pkgdir}/opt/${pkgname}/chrome-sanbox"
}
