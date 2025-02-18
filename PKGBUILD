# Maintainer: Jat <chat@jat.email>

_pkgname='xrdp'
pkgname="$_pkgname-git"
pkgver=0.10.2.r402.g6889a073
pkgrel=1
pkgdesc='An open source remote desktop protocol (RDP) server. Git version, devel branch.'
url='https://github.com/neutrinolabs/xrdp'
arch=('i686' 'x86_64' 'armv6h' 'armv7l' 'aarch64')
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('nasm' 'cmocka')
depends=('libxrandr' 'fuse' 'libfdk-aac' 'ffmpeg' 'imlib2')
checkdepends=('check')
optdepends=('tigervnc' 'tightvnc' 'realvnc-vnc-server')
backup=(
  'etc/xrdp/sesman.ini'
  'etc/xrdp/xrdp.ini'
  'etc/xrdp/cert.pem'
  'etc/xrdp/key.pem'
  'etc/xrdp/startwm.sh'
  'etc/xrdp/reconnectwm.sh'
  'etc/default/xrdp'
)
source=(
  "git+$url#branch=devel"
  'arch-config.diff'
)
sha256sums=(
  'SKIP'
  'bbee3e132915dcc838983d8b9e6c4cecd97b2dcc920e38b3d0689227781ca956'
)
install="$pkgname.install"

pkgver() {
  cd "$srcdir/$_pkgname"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//; s/-/_/'
}

prepare() {
  cd "$srcdir/$_pkgname"

  patch -p2 -i"$srcdir/arch-config.diff"
}

build() {
  cd "$srcdir/$_pkgname"

  ./bootstrap

  CFLAGS="$CFLAGS -ffat-lto-objects" \
    ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --enable-jpeg \
    --enable-tjpeg \
    --enable-fuse \
    --enable-fdkaac \
    --enable-opus \
    --enable-rfxcodec \
    --enable-mp3lame \
    --enable-pixman \
    --enable-painter \
    --enable-vsock \
    --enable-ipv6 \
    --enable-pam-config=arch \
    --enable-rdpsndaudin \
    --with-imlib2

  # Fight unused direct deps
  sed -i -e "s| -shared | $LDFLAGS\0 |g" -e "s|    if test \"\$export_dynamic\" = yes && test -n \"\$export_dynamic_flag_spec\"; then|      func_append compile_command \" $LDFLAGS\"\n      func_append finalize_command \" $LDFLAGS\"\n\0|" libtool

  make
}

check() {
  cd "$srcdir/$_pkgname"

  sed -i "/#include <check.h>/a #ifdef _STDINT_HAVE_STDINT_H\n#define HAVE_STDINT_H\n#endif" tests/xrdp/test_xrdp.h

  make check
}

package() {
  cd "$srcdir/$_pkgname"

  sed -i 's^param=Xorg^param=/usr/lib/Xorg^g' sesman/sesman.ini

  make DESTDIR="$pkgdir" install

  rm "$pkgdir/etc/xrdp/rsakeys.ini"

  install -Dm644 'COPYING' -t "$pkgdir/usr/share/licenses/$_pkgname"
  install -Dm644 instfiles/default/xrdp "$pkgdir/etc/default/$_pkgname"
}
