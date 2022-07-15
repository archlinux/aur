# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: drakkan <nicola dot murino at gmail dot com>
# Contributor: XZS <d dot f dot fischer at web dot de>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Janne Haapsaari <haaja@iki.fi>
# Contributor: Christopher Krooß <didi2002 at web.de>

pkgname=gnome-shell-extension-dash-to-dock43
_pkgname=gnome-shell-extension-dash-to-dock
pkgver=43.alpha
pkgrel=4
pkgdesc='Move the dash out of the overview transforming it in a dock (with GNOME 43 patches)'
url='https://github.com/ubuntu/gnome-shell-extension-dash-to-dock'
arch=('any')
license=('GPL')
depends=('gnome-shell>=43')
makedepends=('git' 'intltool' 'gettext' 'sassc')
conflicts=(${_pkgname} "${_pkgname}-git")
provides=(${_pkgname})
_cvsdir=dash-to-dock
_commit=0fc9d94b59e91e1c08ad38762ebc55b7deaf99ab # master^0
source=(
  "${_pkgname}-${pkgver}::git+https://github.com/micheleg/${_cvsdir}.git#commit=${_commit}"
  "pr1720.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1720.patch"
  "pr1771.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1771.patch"
  "pr1776.patch::https://patch-diff.githubusercontent.com/raw/micheleg/dash-to-dock/pull/1776.patch"
)
b2sums=('SKIP'
        '9fb577d8ab4f9d182cfa1f760f4fc7a35385f23a3e9dae26db531fd05f3a45572d82079ba237be1c9e04706cf43716c546b81876a88e2f23a34b13f3148e6e0d'
        'dacc5c561989cf4fab8171f3b30e293acd9a9ad8e4de327221db5dac0329bef306ccdd36bb1c9f8e47f34b93be0c81a371e950c250162956e7b0c756bbc8bc56'
        '19d36ebb30af337b06e65b1f122984fdb159620a575c2105a29fbf4b78707f4e0bf8c38b6ebe2755c338865bcc7b455a3913f56d2fc83ff61f284f9d63aafc61')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # [daniruiz] Fix stylesheet for gnome 42
  # https://github.com/micheleg/dash-to-dock/pull/1720
  patch --forward --strip=1 --input="${srcdir}/pr1720.patch"

  # [3v1n0] some random fixes for 42
  # https://github.com/micheleg/dash-to-dock/pull/1771
  patch --forward --strip=1 --input="${srcdir}/pr1771.patch"

  # [emansom] metadata: Add support for gnome-shell 43.alpha
  # https://github.com/micheleg/dash-to-dock/pull/1776
  patch --forward --strip=1 --input="${srcdir}/pr1776.patch"
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
