# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Paul Mattal <paul.archlinux.org>

pkgname=truecrypt
pkgver=7.1a
pkgrel=9
epoch=1
pkgdesc='Free open-source cross-platform disk encryption software'
url='http://www.truecrypt.org/'
arch=('x86_64')
license=('custom:TrueCrypt')
depends=('fuse2>=2.8.0' 'wxgtk2' 'libsm' 'device-mapper')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
makedepends=('nasm')
conflicts=('truecrypt-utils')
replaces=('truecrypt-utils')
# N.B. Truecrypt's web-based source download is incompatible with
# makepkg. Source has been placed on ftp.archlinux.org instead
source=(https://sources.archlinux.org/other/tc/truecrypt-${pkgver}.tar.gz{,.sig}
        https://sources.archlinux.org/other/tc/pkcs-2.20.tar.gz
        truecrypt.desktop
        truecrypt-arch-detection.patch
        gcc6.patch
        fix-invalid-characters.patch
        no-exec-stack.patch
        wxwidgets3.patch
        wxwidgets31.patch
        xdg-open.patch)
sha512sums=('b5e766023168015cb91bfd85c9e2621055dd98408215e02704775861b5070c5a0234a00c64c1bf7faa34e6d0b51ac71cd36169dd7a6f84d7a34ad0cfa304796a'
            'SKIP'
            'd69d90040da5bc93f91041ed9404f1614a3b1bdc8eddc2bbbd19367f12d2416a6f3af8b0071d77e1273d627148c63ebe7ebe332878fbe9adb8ae33dcc723f473'
            '1ac13f1888319d6d2f10e03a61e22d68e5fe4a61bbdf8ad364a0fe6f6712cc53dbc1a98fff3fda2ecd57dbe67fcc24fb358c0805ab47eaa12cf14d48f1067e51'
            'fac6963c65720f0b13486ff22bdcc2e31e78c39ede2b9561b2c4037ef2c0375f04c4d51dc6067c37aaeb664c3ed70e5747488389737c41807680750c26a8f084'
            '84175a3677f20b2b03ab29b017b9deecb517a58a640cf667b503cc9375c104b9c0a5d5ea4b3537ba7f12530054a456b466df0afdd935714cd43034b8e6cb2b7c'
            'd52826572178a471bb608fd4991766f4f9fa7c5cbf3659922372feb9fdfcbab596d5f1360e30f66613681619672d0be6c5457f5617f5fb1f84061de779831f96'
            'c64f9255303a521b4e531ebea574befe80a9f193c9aa42fd9cb552e56d087815ca161b50b593e7c3ede10a65c67dc36d0447dbffb0f4d4614f181a95759c2f79'
            'f5dcbcd046489b52657fd99ec1d4d926883414b450af5bbd90890b210988f75055346c9276526486e9db00bffd50926e01c4f17da18144ad903fb40d81043769'
            '461f27cb72a9230591de9131e1f4d32df0531316265164429dfb89b0787d0da25bf6f18231a77d596f2bf0fee4340bec6f3bae8cc1ca8a96cc7e2d2bab04dcee'
            'e60f780bbd2d72ff86ce14df6bda929e696c825f20ccc54bee74c6fc85a98cbf73ccfdb311f6e33c92ef3f7e9095907ab98d62cfe067ab6254513731e9d69ab7')
validpgpkeys=('C5F4BAC4A7B22DB8B8F85538E3BA73CAF0D6B1E0') # TrueCrypt Foundation

prepare() {
  cd ${pkgname}-${pkgver}-source
  patch -p1 < "${srcdir}/truecrypt-arch-detection.patch"
  patch -p0 < "${srcdir}/gcc6.patch"
  patch -p2 < "${srcdir}/fix-invalid-characters.patch"
  patch -p0 < "${srcdir}/no-exec-stack.patch"
  patch -p2 < "${srcdir}/wxwidgets3.patch"
  patch -p2 < "${srcdir}/wxwidgets31.patch"
  patch -p2 < "${srcdir}/xdg-open.patch"
}

build() {
  cd ${pkgname}-${pkgver}-source
  make PKCS11_INC="${srcdir}/pkcs-2.20" \
    WX_CONFIG=/usr/bin/wx-config \
    TC_EXTRA_LFLAGS+="-ldl ${LDFLAGS}" \
    TC_EXTRA_CXXFLAGS="${CXXFLAGS}" \
    TC_EXTRA_CFLAGS="${CFLAGS}"
}

package() {
  cd ${pkgname}-${pkgver}-source
  install -Dm 755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/truecrypt.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm 644 Resources/Icons/TrueCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/truecrypt.xpm"
  install -Dm 644 License.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
