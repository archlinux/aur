# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=nesfab
pkgver=1.0
pkgrel=2
pkgdesc='Programming language for creating NES games'
arch=('x86_64')
url='https://github.com/pubby/nesfab'
license=('GPL3' 'Boost')
depends=('bash' 'boost-libs' 'gcc-libs' 'glibc')
makedepends=('boost')
install="${pkgname}.install"

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pubby/nesfab/archive/v${pkgver}.tar.gz"
  'version-no-git-commit.patch'
  'ada.png'
)

sha512sums=(
  '5c3cf4fbe824ff6c0a850f5bb891a2ce174c963665a65abca9ba74f7f130618d5079e544ebaaf749b1f8c7bca7c49d1317f505a196720519f44bf43daebbf0f6'
  'aae378095d1cb2797ced05efb5ab87fdfc8e9c8c3c4aaa00d27a8ec76125a0a628364f314defdb29797cb7fd1c00035788e7f2393eb34d70a58a4a8db2b7898c'
  '74f6199454f64ed2f4a4ba998bf11b1bab07d3944b35c49827f64cdf233e318393e4d93a954b8c39504b814db8ebe68d72b72566afecd3e275739d9b0afa194a'
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Remove dependency on Git commit, which is unknown to this build.
  # Use sed to pre-process the Makefile to avoid conflicts during
  # patching, because the VERSION line in the surrounding context
  # changes on every release.
  sed -i -e '/^GIT_COMMIT :=.*$/d' Makefile
  patch -p1 < ../version-no-git-commit.patch

  # https://pursuit.unimelb.edu.au/articles/it-s-time-to-retire-lena-from-computer-science
  cp -v ../ada.png examples/pbz/bg.png

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
