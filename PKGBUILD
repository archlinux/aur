# Maintainer: Atom Long <atom.long@hotmail.com>

_pkgname=freenom
pkgname=${_pkgname}-git
pkgver=20230307
pkgrel=2
pkgdesc='Freenom domain name renews automatically'
arch=('any')
url='https://github.com/luolongfei/freenom'
license=('MIT')
depends=('php')
options=('!strip')
source=(${_pkgname}::"git+${url}.git"
        '0001-Fix-Creation-of-dynamic-property-is-deprecated.patch'
        'freenom.service'
        'freenom.timer')
sha512sums=('SKIP'
            '5cc6541371f5dfe4db60b587dc2601a841ecc3e68d1284fd598f32c29e0b68104e8d4ef245c8ac75d09aa12117bbef719ffda40d0a188f638cfa00b5baf5543f'
            'b84774484f29b64583255f283cc2d3db0d7682c645a350627c8a7e8b728541bd627d54e177410ecf3fade9e4508a0fddc06c9d14bafe71699bb5fbb2a5a89dbf'
            '0d7b19b9d00d93ce71c29c30fc5613d820dfa783ace7bf222c7cc920a785545eda8bb8d41c1e04bd253953341d9893eab6faaeb89c423b8d31412551c436d1f5')
provides=("freenom")
install=freenom.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  git apply ${srcdir}/0001-Fix-Creation-of-dynamic-property-is-deprecated.patch
}

package() {
  cd "$pkgdir"
  # create folders
  install -dm0755 usr/share/webapps usr/lib/systemd/system etc/webapps/freenom var/log/freenom
  
  # remove unused files.
  rm -rf "${srcdir}/${_pkgname}"/{.git,.github}
  
  # app
  cp -a "${srcdir}/${_pkgname}" usr/share/webapps/freenom
  
  # service
  install -Dm644 ${srcdir}/freenom.service usr/lib/systemd/system/freenom.service
  
  # timer
  install -Dm644 ${srcdir}/freenom.timer usr/lib/systemd/system/freenom.timer
  
  # config
  install -Dm0644 "${srcdir}/${_pkgname}"/.env.example etc/webapps/freenom/freenom.conf
  ln -vsf /etc/webapps/freenom/freenom.conf usr/share/webapps/freenom/.env
  
  # log
  rm -rf usr/share/webapps/freenom/logs
  ln -vsf /var/log/freenom usr/share/webapps/freenom/logs
}

# vim:set ts=2 sw=2 et:
