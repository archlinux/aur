# Maintainer: Ewout van Mansom <ewout@vanmansom.name>

_extname=bedtime-mode
_reponame=gnome-bedtime-mode
_uuid=gnomebedtime@ionutbortis.gmail.com
pkgname=gnome-shell-extension-bedtime-mode
pkgver=v20.0+r1+gf4570d0
_zipver=20.0
pkgrel=1
pkgdesc='Converts to grayscale the entire GNOME workspace by using a smooth transition.'
arch=('any')
url='https://github.com/ionutbortis/gnome-bedtime-mode'
license=('GPL3')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:43')
makedepends=('git' 'glib2' 'unzip')
_commit=f4570d01312b29e008779253ee3f3fcfea267e28  # main^0
source=(
  "git+${url}.git#commit=${_commit}"
)
b2sums=('b173905f70a709a93d0ad9580d5159e7be3f28886d157ae1203965eb035d27b9f8bd5763ab51455de06daaef2afe1b5535ee4f1fcd9b5cadc65e1db9f38393e8')

pkgver() {
  cd "${srcdir}/${_reponame}"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "${srcdir}/${_reponame}"
  ./scripts/build.sh
}

package() {
  cd "${srcdir}/${_reponame}"

  install -d "${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
  install -d "${pkgdir}/usr/share/glib-2.0/schemas"

  # copy extension schema to system-wide glib-2.0 location
  cp -r src/schemas/*gschema.* "${pkgdir}/usr/share/glib-2.0/schemas"

  unzip -q build/"${_reponame}"_"${_zipver}".zip -d "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  # remove redundant gschema, as it available to glib-2.0 system wide
  rm "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas/org.gnome.shell.extensions.bedtime-mode.gschema.xml"
  rmdir "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  chown root:root -R "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
}
