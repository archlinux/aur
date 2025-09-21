# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=nesfab
pkgver=1.8
pkgrel=1
pkgdesc='Programming language for creating NES games'
arch=('x86_64')
url='https://github.com/pubby/nesfab'
license=('GPL-3.0-only' 'BSL-1.0')
depends=('bash' 'boost-libs' 'gcc-libs' 'glibc')
makedepends=('boost' 'gcc' 'imagemagick')
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pubby/nesfab/archive/v${pkgver}.tar.gz"
  'version-no-git-commit.patch'
  'ada.png'
)

sha512sums=('f1a72e893f1c56ad8996250c04fb58a1705257d500c93e690a8f202d3f2add6dd319374a76016da3efd5a5c3e532ff8c1abcc3aec5c9a5ee60d696959d067ce6'
            'bfbe769ccdb32237044cdfb27d88854fe002d3114969071e31e4fbf817df4bd272ec5068a75a26e7d3d71dead322dc31089db5af0602c47261f2778bde31d100'
            '74f6199454f64ed2f4a4ba998bf11b1bab07d3944b35c49827f64cdf233e318393e4d93a954b8c39504b814db8ebe68d72b72566afecd3e275739d9b0afa194a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Remove dependency on Git commit, which is unknown to this build.
  # Use sed to pre-process the Makefile to avoid conflicts during
  # patching, because the VERSION line in the surrounding context
  # changes on every release.
  sed -i -e '/^GIT_COMMIT :=.*$/d' Makefile
  patch -p1 < ../version-no-git-commit.patch

  # https://pursuit.unimelb.edu.au/articles/it-s-time-to-retire-lena-from-computer-science
  for example in fade rainbow mapper_30 mapper_189 mmc3 mmc5 pbz scanline_irq; do
    cp -v ../ada.png "examples/${example}/bg.png"
  done
  magick -verbose ../ada.png -flop examples/mapper_30/bg2.png

  # Tweak example script so it expects the executable to live in /usr/bin
  # shellcheck disable=SC2016
  sed -i 's#\.\./nesfab #/usr/bin/nesfab "$(dirname "${BASH_SOURCE[0]}")"/#' \
    examples/build_all.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make 'CXXFLAGS=-Wl,-z,now' release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo >&2 'Packaging documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/doc.adoc
  cp -R --preserve=mode syntax_highlighting \
    "${pkgdir}/usr/share/doc/${pkgname}"

  echo >&2 'Packaging executable'
  install -D -m 755 -t "${pkgdir}/usr/bin" nesfab

  echo >&2 'Packaging examples and library'
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -R --preserve=mode examples lib "${pkgdir}/usr/share/${pkgname}"

  echo >&2 'Packaging environment additions'
  mkdir -p "${pkgdir}/etc/profile.d"
  echo 'export NESFAB=/usr/share/nesfab' \
    > "${pkgdir}/etc/profile.d/${pkgname}.sh"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    COPYING doc/LICENSE_1_0.txt
}
