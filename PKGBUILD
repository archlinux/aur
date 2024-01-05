# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

set -u
pkgname=pesign
pkgname+='-git'
pkgver=0.116.r8.g1fb3c85
pkgrel=1
pkgdesc="Linux tools for signed PE-COFF binaries"
pkgdesc+=' - GIT Version'
arch=(x86_64)
url="https://github.com/rhboot/pesign"
license=(GPL3)
depends=(
  bash
  gcc-libs
  glibc
  efivar
  util-linux-libs
  nspr
  nss
  popt
)
makedepends=(mandoc)
makedepends+=('git')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
options=(debug)
options=('!strip' '!emptydirs' 'docs')
_srcdir="${pkgname%-git}"
_ar='https://gitlab.archlinux.org/archlinux/packaging/packages/pesign/-/raw/main/'
source=(
  "git+${url}.git"
  "${_ar}pesign-116-remove_root_check.patch" # remove root check so that we may run as unprivileged user: https://github.com/rhboot/pesign/issues/57
  "${_ar}pesign.sysusers"
  "${_ar}pesign.tmpfiles"
  "${_ar}pesign.service"
  "${_ar}pesign-create-db.service"
)
md5sums=('SKIP'
         'a7a49a14a22bae8d906073d9d20b615f'
         '22cb16b8ad6509c8625eaef613ecd616'
         'b1922bd2262384374c4aa9262005abcb'
         'fa384b4a114ed22c4f15678b296f21ac'
         'a2c1342392f98dc0dff5864129689171')
sha512sums=('SKIP'
            'c79365268a56111af98b5ed20518df9ab955531d4a3978de83b2491ae9b96643cc7bfb6f24ca493885275429a4ecb79e6edb8135206ea65c4147d63727aa8f3a'
            '46c9958170924632fdf8fdf7b07eac5b35fc2a9292c84e346d9fc69cbedbfb762fc911c5c5dbf6e8391fa38a4f747b891dd295f14b47f594814572a07fcbc44c'
            '2dca9a1aba9485afe6f07b7a3d9ee1dd0cd7640264f7584e739cab126b501ac1962a3b37509744a2b77abc613c75222801daf2e4fd97dd5211d19fbb7bd9ec33'
            '5e4eb101b01fd688ca915051e25978e6b7a27ad2588c6b04ed52c179a00c04c1298080f9c2c0ae982cd0d861c649e5e6c244e54cb4962ca39c1d2264d1ec12df'
            '14a161ec3a883d5c17581a6743a9b5e67e1617228966c4972933a055618f157aafefe8b0f648cb07251f0076384dd19be605acc6b1d31e7dec67749a682f505c')
b2sums=('SKIP'
        '77edd4517c46c71d63c8003045ae16b9a252bf9e0e070066142f397b21d2a3634d4c4e72d1eab0a32aed441d860db7c7b9546d6b018200a6d85f9b32bf577ec2'
        'c4a1934f747207ffc6414db831ef138318a062e3b7186891e5294b7fb87b843204070573c762aa8da519f9c076601d8d343fcd2c336c9f7f78ee32781e930def'
        'ea7e579848648df60da248f657402cdbe3b0b866e6dcf7c062a39914e297f1dde91ec8a7d7dcfa3081c4309604c464a9e3f1263795cc3001fdbaef711028d3e5'
        '8daa7a7b5042a1d19ef53092b4c200d5ce12736d72dd561fac1adf6262db18dfc54eeaad7cf28365e06dc8322ba435674d608fdeb165c86c9f148852c2e48cea'
        '94bb44d1a95a31958b2808ae70782c3f3e38c26a132659ded7cf7ba5548e39b790bf54e6e62f0b3634fbcd21d68b62108e2ce18b0689500982225f45ca5a3b2e')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf '0.'
  git describe --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  #git clean -x -d -f
  # -Werror, not even once
  sed -e 's/\-Werror//g' -i 'Make.defaults'
  local _f
  for _f in "${source[@]}"; do
    _f="${_f%%::*}"
    _f="${_f##*/}"
    if [[ "${_f}" = *.patch ]]; then
      set +u; msg "Patch ${_f}"; set -u
      patch -Nup1 -i "${srcdir}/${_f}"
    fi
  done
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  local make_options=(
    DESTDIR="${pkgdir}"
    rundir=/run/
    libdir=/usr/lib/
    libexecdir=/usr/lib/
    install
  )

  make "${make_options[@]}"

  # remove a lot of stuff that we don't need
  # rm -rfv "${pkgdir}/"{run,var,etc/{rpm,pesign,pki},usr/lib}
  rm -frv "${pkgdir}/"{run,etc/{rpm,pki/pesign-rh-test/}}

  install -vDm 644 "${srcdir}/${pkgname%-git}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
  install -vDm 644 "${srcdir}/${pkgname%-git}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-git}.conf"

  # install custom service, that can run as separate user
  install -vDm 644 "${srcdir}/${pkgname%-git}"*.service -t "${pkgdir}/usr/lib/systemd/system/"
  install -vdm 755 "${pkgdir}/etc/pki/pesign"
  set +u
}
set +u
