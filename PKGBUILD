# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock-gnome43
_pkgname=gnome-shell-extension-dash-to-dock
pkgver=43.alpha
pkgrel=2
pkgdesc='Move the dash out of the overview transforming it in a dock (with GNOME 43 patches)'
url='https://github.com/ubuntu/gnome-shell-extension-dash-to-dock'
arch=('any')
license=('GPL')
depends=('gnome-shell>=43')
makedepends=('git' 'intltool' 'gettext' 'sassc')
conflicts=(${pkgname%-gnome43} "${_pkgname}-git")
provides=(${pkgname%-gnome43})
_srcname=dash-to-dock
_commit=0fc9d94b59e91e1c08ad38762ebc55b7deaf99ab # master^0
source=(
  "${_pkgname}-${pkgver}::git+https://github.com/micheleg/${_srcname}.git#commit=${_commit}"
  "1720.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1720.patch"
  "1771.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1771.patch"
  "1775.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1775.patch"
)
sha256sums=('SKIP'
            'f9f1c15e6e1cdfa027478f35ded42fdbb438b7f98650f9f54c9145a36cdd6fa3'
            '878b29f280d0a21a34a203202281689fac97c33185bbee76f4876de6d608e160'
            'e81b0b59f979956b5b6011247ffd63d887bd11bb629f6ec7dc69682cd701e41a')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # [daniruiz] Fix stylesheet for gnome 42
  # https://github.com/micheleg/dash-to-dock/pull/1720
  patch --forward --strip=1 --input="${srcdir}/1720.patch"

  # [3v1n0] some random fixes for 42
  # https://github.com/micheleg/dash-to-dock/pull/1771
  patch --forward --strip=1 --input="${srcdir}/1771.patch"

  # [emansom] Add support for gnome-shell 43
  # https://github.com/micheleg/dash-to-dock/pull/1775
  patch --forward --strip=1 --input="${srcdir}/1775.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" VERSION="${pkgver}" install
}

# vim: ts=2 sw=2 et:
