# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: John Doe <kitterhuff@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname="aide"
pkgver=0.19.2
pkgrel=1
pkgdesc="A file integrity checker and intrusion detection program"
arch=("x86_64" "armv7h" "aarch64")
url="https://aide.github.io/"
license=("GPL")
depends=("acl"
         "e2fsprogs"
         "libelf"
         "mhash"
         "pcre")
source=("https://github.com/aide/aide/releases/download/v$pkgver/aide-$pkgver.tar.gz"{,.asc} \
        "aide.conf"
        "aidecheck.service"
        "aidecheck.timer")
b2sums=('64ef90f88f046890a056301e52bdcc9d65107bdce60b31b6faea8a18c60eec7f28a40cc8c02c77a9e6dc7943c79f74dd6a4483daf0cb7fc205728f62eb872e4e'
        'SKIP'
        '2e16baf306dcbe5d5207685391bb3e77b80a8caafaeafee3094228ee19671092afc042762523663a1d5155341a5d190c5e6c355d639e1a840efddf56047c05bc'
        'fcae2514bffcfe8c2110c8b82d857f39de8c95e0d7d2788bb4945243c127c9566871606b9e4bca39034b624c7bd579f46ed88cb0b86830d6ff16ff1fbb04b081'
        'af16bbf1d69226d445820ba1e7beaba8142a19eb3120f5b58db048083d94ec22f857a28dfe403bd885aafe31b748a10ce9de759480947d4b34b29e2b1a678071')
validpgpkeys=("2BBBD30FAAB29B3253BCFBA6F6947DAB68E7B931") # Hannes von Haugwitz <hannes@vonhaugwitz.com>
backup=("etc/aide.conf")
install="aide.install"

build(){
 cd "$pkgname-$pkgver"
 ./configure \
  --prefix="/usr" \
  --sysconfdir="/etc" \
  --with-posix-acl \
  --with-xattr \
  --with-zlib \
  --with-e2fsattrs \
  --disable-static \
  --with-curl
 make
}

package(){
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 install -d -m 700 "$pkgdir/var/lib/aide"
 install -d -m 700 "$pkgdir/var/log/aide"
 install -D -m 600 "$srcdir/aide.conf" "$pkgdir/etc/aide.conf"
 install -D -m 644 "$srcdir/aidecheck.service" -t"$pkgdir/usr/lib/systemd/system"
 install -D -m 644 "$srcdir/aidecheck.timer"   -t "$pkgdir/usr/lib/systemd/system"
}

