# Maintainer: kitsunyan <`echo a2l0c3VueWFuQGFpcm1haWwuY2MK | base64 -d`>

pkgname=panasonic-mfp
_pkgname_print=mccgdi
_pkgver_print=2.0.10
_pkgname_scan=panamfs-scan
_pkgver_scan=1.3.1
pkgver=3.3.11
pkgrel=2
pkgdesc='Minimal drivers pack for Panasonic multi-function printers'
arch=('x86_64' 'i686')
url='https://panasonic.net/cns/pcc/support/fax/common/table/linuxdriver.html'
license=('custom:panasonic')
depends=(libusb-compat)
optdepends=('cups: printer support'
            'sane: scanner support')
conflicts=("${_pkgname_print}" "${_pkgname_scan}")
_url='http://cs.psn-web.net/support/fax/common/file'
source_x86_64=("${_url}/Linux_PrnDriver/Driver_Install_files/${_pkgname_print}-${_pkgver_print}-x86_64.tar.gz"
               "${_url}/Linux_ScanDriver/${_pkgname_scan}-${_pkgver_scan}-x86_64.tar.gz")
source_i686=("${_url}/Linux_PrnDriver/Driver_Install_files/${_pkgname_print}-${_pkgver_print}-i686.tar.gz"
             "${_url}/Linux_ScanDriver/${_pkgname_scan}-${_pkgver_scan}-i686.tar.gz")
sha256sums_x86_64=('e2532473a3843f859c0207f91483dd4a156a167e5244e7a7fd605578e85163a9'
                   '01829def2a8ea215c59d60327c085f382c88033054879f178559fa76293d6801')
sha256sums_i686=('536060e3cc75b54c1f08c1c02aa100a6ba9c82b2a60adc6c6ef939e0c73c72da'
                 '4f3481370b94790431b71538e9d556f96272689f1da228f08245ffcd604175b8')

pkgver() {
  local v0 v1 v2
  v0=()
  v1=(`tr '.' ' ' <<< "${_pkgver_print}"`)
  v2=(`tr '.' ' ' <<< "${_pkgver_scan}"`)

  local i
  for i in `seq 0 $(("${#v1[@]}" - 1))`; do
    v0+=($(("${v1[$i]}" + "${v2[$i]}")))
  done

  (IFS=.; echo "${v0[*]}")
}

package() {
  findhere() { find . -mindepth 1 -maxdepth 1 -name "$1"; }
  tohex() { od -An -tx1 -v | tr '\n' ' ' | sed 's/ //g'; }
  hexstr() { printf '%s' "$@" | tohex; }
  tobytes() { sed 's/\(..\)/\\x\1\n/g' | xargs -d '\n' -n 500 echo | sed 's/ //g' | xargs -d '\n' -n 1 printf; }
  zeros() { for i in `seq 1 "$1"`; do echo -n '00'; done }
  hexsed() { sed "s/`hexstr "$1"`/`hexstr "$2"``zeros $(("${#1}" - "${#2}"))`/g"; }

  cd "$srcdir/${_pkgname_print}-${_pkgver_print}-$arch"

  mkdir -p "$pkgdir/var/spool/.panamfs"
  chmod 777 "$pkgdir/var/spool/.panamfs"

  for f in 'L_H0JDJCZAZ_2' 'L_H0JDJCZAZ'; do
    install -Dm755 "lib/$f.so.1.0.0" "$pkgdir/usr/lib/$f.so.1.0.0"
    ln -sf "$f.so.1.0.0" "$pkgdir/usr/lib/$f.so.1"
    ln -sf "$f.so.1" "$pkgdir/usr/lib/$f.so"
  done

  mkdir -p "$pkgdir/usr/lib/cups/filter/"
  for f in 'L_H0JDGCZAZ'; do
    # replace /usr/local path in binary file
    cat "filter/$f" |
    tohex |
    hexsed '/usr/local/share/panasonic/printer/data/' '/usr/share/mccgdi/' |
    tobytes \
    > "$pkgdir/usr/lib/cups/filter/$f"
    chmod 755 "$pkgdir/usr/lib/cups/filter/$f"
  done

  for f in `cd ppd && findhere '*.ppd'`; do
    install -Dm755 "ppd/$f" "$pkgdir/usr/share/cups/model/panasonic/$f"
  done

  for f in `cd data && findhere '*.SPC' && findhere '*.TBL'`; do
    install -Dm755 "data/$f" "$pkgdir/usr/share/mccgdi/$f"
  done

  install -Dm644 'Version.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-${_pkgname_print}"

  cd "$srcdir/${_pkgname_scan}-${_pkgver_scan}-$arch"

  install -Dm755 "sane-backend/libsane-panamfs.so.${_pkgver_scan}" "$pkgdir/usr/lib/sane/libsane-panamfs.so.${_pkgver_scan}"
  ln -sf "libsane-panamfs.so.${_pkgver_scan}" "$pkgdir/usr/lib/sane/libsane-panamfs.so.${_pkgver_scan%%.*}"
  ln -sf "libsane-panamfs.so.${_pkgver_scan%%.*}" "$pkgdir/usr/lib/sane/libsane-panamfs.so"

  install -Dm644 'sane-backend/panamfs.conf' "$pkgdir/etc/sane.d/panamfs.conf"
  install -Dm644 <(echo panamfs) "$pkgdir/etc/sane.d/dll.d/panamfs.dll.conf"

  # generate udev rules based on panamfs.conf file
  mkdir -p "$pkgdir/usr/lib/udev/rules.d/"
  grep -Po '(?<=^usb )0x[0-9a-f]{4} 0x[0-9a-f]{4}$' 'sane-backend/panamfs.conf' |
  sed 's/0x//g' |
  while read -r device; do
    device=($device)
    echo \
    'ATTRS{idVendor}=="'"${device[0]}"'",' \
    'ATTRS{idProduct}=="'"${device[1]}"'",' \
    'MODE="0664",' \
    'GROUP="lp",' \
    'ENV{libsane_matched}="yes"'
  done \
  > "$pkgdir/usr/lib/udev/rules.d/52-sane-panamfs.rules"

  install -Dm644 'Version.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-${_pkgname_scan}"
}
