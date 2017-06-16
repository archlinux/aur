_username=volunode
_reponame=volunode
#_ref="#branch=BranchID"
#_ref="#commit=CommitID"
_pkgbase=volunode
pkgname=${_pkgbase}-git
pkgdesc="Next generation client for Berkeley Open Infrastructure for Network Computing."
pkgver=r30264.41d8578cd
pkgrel=1
arch=(
    'x86_64'
)
url="https://github.com/$_username/${_reponame}"
license=('LGPL')
depends=(
    'curl'
    'libbsd'
    'boinc-app-api'
)
makedepends=(
    'git'
    'curl'
    'meson'
    'pstreams'
)
install=$_pkgbase.install
options=('!staticlibs')
source=("git+https://github.com/${_username}/${_reponame}${_ref}"
         $_pkgbase.service
         $_pkgbase.sysusers)
sha256sums=(
            'SKIP'
            '194e196253046ae6515322332dfd14111aa2fb9de8bf6ed75423de30170e7883'
            'c7a03d70cce6206d071d99c13315977db4c4deac2cab52a236f0825325720907'
            )

pkgver() {
  cd "${_reponame}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  if [ ! -d ${srcdir}/build ]; then
    cd ${srcdir}/${_reponame}
    meson --prefix=/usr --buildtype=release ${srcdir}/build
#   meson --prefix=/usr --buildtype=debug ${srcdir}/build
    cd ..
  fi

  cd ${srcdir}/build

  ninja
}

package() {
  cd ${srcdir}/build

  DESTDIR="${pkgdir}" ninja install

  #install systemd unit
  install -Dm644 "${srcdir}/${_pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgbase}.service"

  #install sysusers conf
  install -Dm644 "${srcdir}/${_pkgbase}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"

  #remove initscripts stuff
  rm -rf "${pkgdir}/etc"
}
