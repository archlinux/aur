# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
# Contributor: Alexandre Filgueira (faidoc) <alexfilgueira@antergos.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=csd-background
_realname=cinnamon-settings-daemon
pkgver=6.0.0
pkgrel=1
pkgdesc="The Cinnamon Settings daemon (background plugin only)"
arch=('x86_64')
url="https://github.com/linuxmint/${_realname}"
license=('GPL')
depends=('cinnamon-desktop' libnotify 'polkit')
optdepends=('cinnamon-translations: i18n')
makedepends=('meson' 'samurai')
conflicts=("$_realname")
options=('!emptydirs')
source=("${_realname}-${pkgver}.tar.gz::${url}/archive/${pkgver}/${_realname}-${pkgver}.tar.gz"
        strip-{plugins,dependencies}.patch)
sha512sums=('44348765bf8c0cb941d177a6765aef10796d72f5c215dbffa4b514523956e257128d6bbbb0dcd9c3f0b2bcde24745e082ad82a7cee149125903e13b349c07200'
            '600359796ecd9ebcc54d2e96f75722e03e394c43468a1ac5ecb2a9171f57ead1a7a01bc8156b77c89adb06edc71fa58b71ebfbe6c911178354d5a390c05f1592'
            'e5adc6badb72e55f359289afb2d7b5f796555d6e2cc0dcfb896cddf6cc54e97f8cc63637b96a7389afd4166b04ebd2ca82377878cf55ddb88a93c94e9790e373')
b2sums=('f05e14e9d3c15bc94df5435b0f317e1924993fbf4908491ea5a825b623c6a6f127ce20f5c31f54bfbd547a70ad645c3dbe71d9c55f790a3e0730d55bc58d6316'
        'e36f06bbbacb205f3df3bdc3c1ebaeb317411c38622a52121ab4c58376dd391339072dc5dc3cf8b8b10b2c5d66650493d00363024531535eeeb368acaacfde7f'
        '098449f15eb34167517e2d1ed6261ea355cb3f474b305356f9625f0fee16ab750106e5cddb67e9d4c36977913133b9984bfd56a6194e3ad4cf48caed71d87c2f')

prepare() {
   cd "${srcdir}"/${_realname}-${pkgver}
   patch -Np1 < ../strip-plugins.patch
   patch -Np1 < ../strip-dependencies.patch
}

build() {
  arch-meson --libexecdir=lib/${_realname} ${_realname}-${pkgver} build

  samu -C build
}

package() {
    DESTDIR="${pkgdir}" samu -C build install

    find "${pkgdir}" \( -type f -o -type l \) ! \( -name '*background*' -o -name '*.pc' -o -name '*.so' \) -delete
}
