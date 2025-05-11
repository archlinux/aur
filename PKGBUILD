# Maintainer:
# Contributor: Josef Miegl <josef@miegl.cz>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Simo L. <neotuli@yahoo.com>
# Contributor: eric <eric@archlinux.org>

_pkgname="sane"
pkgname="$_pkgname-git"
pkgver=1.4.0.r3.g02e4000
pkgrel=1
pkgdesc="Scanner Access Now Easy"
url="https://gitlab.com/sane-project/backends"
arch=('x86_64')
license=(
  'GPL-2.0-or-later'
  'LicenseRef-GPL-2.0-or-later-with-linking-exception'
)

depends=(
  'bash'
  'cairo'
  'libpng'
  'libieee1284'
  'net-snmp'
  'v4l-utils'
)
makedepends=(
  'autoconf-archive'
  'avahi'
  'curl'
  'git'
  'glib2'
  'libgphoto2'
  'libjpeg-turbo'
  'libtiff'
  'libusb'
  'libxml2'
  'poppler-glib'
  'python'
  'systemd'
  'texlive-latexextra'
)
optdepends=(
  'sane-airscan: for scanners working in driverless mode'
)

provides=(
  "$_pkgname=${pkgver%%.g*}"
  'libsane.so'
)
conflicts=("$_pkgname")

_pkgsrc="sane-backends"
source=(
  "$_pkgsrc"::"git+$url.git"
  '66-saned.rules'
  'sane.sysusers'
  'saned.service'
  'saned.socket'
)
sha256sums=(
  'SKIP'
  '0e98982ff1550b16b098f7563569c203aab5f7b4172717bec0d42eab15fb875b'
  '8ef5d3b557c40019b34851d2130b3cb64e519298e60804f00d25de489bdeffcb'
  '518f86d981057ca3c716815903c7eba471184b321154e78f8f9b9cfd2f05dadb'
  '67e988f3294f33abd34974367fb3b48cd6d71a5c507d3ad9b0f86c5d7eac2dd6'
)

pkgver() {
  cd "$_pkgsrc"
  local _tag _version _revision _hash
  _tag=$(git tag -l '[0-9]*' | grep -Ev '[A-Za-z][A-Za-z]' | sort -rV | head -1)
  _version="${_tag:?}"
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _commit=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_version:?}" "${_revision:?}" "${_commit:?}"
}

prepare() {
  # extract custom license exception
  sed '1,41p' "$_pkgsrc/backend/dll.c" > LicenseRef-GPL-2.0-or-later-with-linking-exception.txt

  cd "$_pkgsrc"
  # copy translation files so they become reproducible: https://gitlab.com/sane-project/backends/-/issues/647
  cp -v po/en{_GB,@quot}.po
  cp -v po/en{_GB,@boldquot}.po
  # create version files, so that autotools macros can use them:
  # https://gitlab.com/sane-project/backends/-/issues/440
  printf "%s\n" "$pkgver" > .tarball-version
  printf "%s\n" "$pkgver" > .version
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --disable-locking
    --disable-rpath
    --docdir="/usr/share/doc/$_pkgname"
    --enable-pthread
    --localstatedir=/var
    --sbindir=/usr/bin
    --sysconfdir=/etc
    --with-avahi
    --with-libcurl
    --with-pic
    --with-poppler-glib
    --with-systemd
    --with-usb
  )

  cd "$_pkgsrc"
  ./configure "${configure_options[@]}"

  # circumvent overlinking in libraries
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool
  make
}

package() {
  depends+=(
    avahi libavahi-client.so libavahi-common.so
    curl libcurl.so
    glib2 libgobject-2.0.so
    libgphoto2 libgphoto2.so libgphoto2_port.so
    libjpeg-turbo libjpeg.so
    libtiff libtiff.so
    libusb libusb-1.0.so
    libxml2 libxml2.so
    poppler-glib libpoppler-glib.so
    systemd-libs libsystemd.so
  )

  cd "$_pkgsrc"

  make DESTDIR="$pkgdir" install

  # install custom license
  install -vDm 644 ../LicenseRef-GPL-2.0-or-later-with-linking-exception.txt -t "$pkgdir/usr/share/licenses/$pkgname/"

  # generate udev udev+hwdb
  install -vdm 755 "$pkgdir/usr/lib/udev/rules.d/"
  tools/sane-desc -m udev+hwdb -s doc/descriptions/ > "$pkgdir/usr/lib/udev/rules.d/65-sane.rules"
  tools/sane-desc -m udev+hwdb -s doc/descriptions-external/ >> "$pkgdir/usr/lib/udev/rules.d/65-sane.rules"
  # generate udev hwdb
  install -vdm 755 "$pkgdir/usr/lib/udev/hwdb.d/"
  tools/sane-desc -m hwdb -s doc/descriptions/ > "$pkgdir/usr/lib/udev/hwdb.d/20-sane.hwdb"
  # NOTE: an empty new line is required between the two .desc collections
  printf "\n" >> "$pkgdir/usr/lib/udev/hwdb.d/20-sane.hwdb"
  tools/sane-desc -m hwdb -s doc/descriptions-external/ >> "$pkgdir/usr/lib/udev/hwdb.d/20-sane.hwdb"

  # systemd integration
  install -vDm 644 ../${_pkgname}d.socket -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../${_pkgname}d.service "$pkgdir/usr/lib/systemd/system/${_pkgname}d@.service"
  install -vDm 644 ../66-${_pkgname}d.rules "$pkgdir/usr/lib/udev/rules.d/"
  # sysusers.d
  install -vDm 644 ../sane.sysusers "$pkgdir/usr/lib/sysusers.d/sane.conf"

  # remove old ChangeLogs
  rm -rvf "$pkgdir/usr/share/doc/$_pkgname/ChangeLogs/"

  # add files below /etc/sane.d to backup array
  cd "$pkgdir"
  # trick extract_function_variable() in makepkg into not detecting the
  # backup array modification and adding remaining configuration files
  [[ /usr/bin/true ]] && backup=(${backup[@]} $(find "etc/${_pkgname}.d/" -type f | sort))
}
