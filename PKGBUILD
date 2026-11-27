# Maintainer: czyt <czytcn@gmail.com>
pkgname=agentero-desktop-bin
pkgver=0.19.1
pkgrel=1
pkgdesc="Unified research workspace for humans and agents: PDF question answering with citations, a vault for research material and writing tools"
arch=('x86_64' 'aarch64')
url="https://github.com/poco-ai/Agentero"
license=('MIT')
depends=('cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libsecret' 'libsoup3' 'libstdc++' 'webkit2gtk-4.1')
optdepends=('nodejs: run the agent adapters that come with the app'
            'openssh: reach a remote research workspace')
# The upstream project also publishes a Debian package under the name
# "agentero"; the AUR package of that name belongs to somebody else, so both
# packages declare a conflict with each other.
provides=('agentero')
conflicts=('agentero-bin')
options=('!strip' '!debug')

# The Debian packages of the desktop app. The spelling of the file name has
# changed between releases, so the part in front of the version is written
# down separately and follows the release.
_deb_prefix="Agentero_"
_deb_x86_64="${_deb_prefix}${pkgver}_amd64.deb"
_deb_aarch64="${_deb_prefix}${pkgver}_arm64.deb"

_releases="https://github.com/poco-ai/Agentero/releases/download/v${pkgver}"

source=("LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_deb_x86_64}::${_releases}/${_deb_x86_64}")
source_aarch64=("${_deb_aarch64}::${_releases}/${_deb_aarch64}")
sha256sums=('f2b7f0cc6fb11f63654ac171d46640de6a8f63407a1a9fa77181a5c43a841fcf')
sha256sums_x86_64=('b48fa9bc86348ffbd050c839b08e435a513012d5ab2e4bbd57d74b42967f012f')
sha256sums_aarch64=('3bdd0c08b5e10e1fa9321f68606b2d193510dad74d8b2435cae2de40108ac172')
noextract=("${_deb_x86_64}" "${_deb_aarch64}")

package() {
  local deb_var="_deb_${CARCH}"
  local deb="${!deb_var}"
  local data_archive

  # The compression has not been stable either, so the member is looked up
  # instead of assumed.
  data_archive="$(bsdtar -tf "${srcdir}/${deb}" | sed -n '/^data\.tar\./{p;q;}')"
  if [[ -z "$data_archive" ]]; then
    echo "Could not find data.tar.* in ${deb}" >&2
    return 1
  fi

  bsdtar -xOf "${srcdir}/${deb}" "${data_archive}" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}"

  # The larger icons are shipped under a "@2" name, which the hicolor theme
  # does not pick up.
  for size in 256x256 1024x1024; do
    if [ -d "${pkgdir}/usr/share/icons/hicolor/${size}@2" ] &&
       [ ! -e "${pkgdir}/usr/share/icons/hicolor/${size}" ]; then
      mv "${pkgdir}/usr/share/icons/hicolor/${size}@2" \
         "${pkgdir}/usr/share/icons/hicolor/${size}"
    fi
  done

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
