# Maintainer: Lindsay Zhou <i@lin.moe>

_pkgname="memos"
_gitauthor="usememos"
_gitbranch="main"


pkgname="${_pkgname}-git"
pkgver=0.11.2.r44.g8eed9c26
pkgrel=1
pkgdesc="A lightweight, self-hosted memo hub. Open Source and Free forever."
url="https://github.com/${_gitauthor}/${_pkgname}"
arch=("any")
license=('MIT')
makedepends=("go" "git" "yarn")
depends=("glibc")
provides=("${pkgname}")
source=(
  "git+https://github.com/${_gitauthor}/${_pkgname}.git#branch=${_gitbranch}"
  "systemd.service"
  "sysusers.conf"
  "memos.conf"
  'tmpfiles.conf'
)
sha512sums=('SKIP'
  '91e3841763fc3b81ad54fdd30b465a0aad64c1a9212c12fb3420168cf1c4657407ba008e7172181219a476b3a252a3631748596b7b8863ceb3a6ee6d5c77c253'
  '692dc4674b86b36c5464c78f493ace50091068f962d40130a32b4ed17517d77e33860333e870f5e80a5e17b6cbd5de45bf57e7de5ea7984bd4e36f95a8daf0fa'
  'ff6f9ef97e5d7da3a2899e2757d83c028883df230d03178963b6784d534cbdcbf016a64718691c0893952c24dbd86495343ea8072e60aee9614db23505105b7e'
  'cf88b91a88825dcfda35f45461513b8a2e03b07890189fd1cf7b60aa4085c9e88d8338596b69a3d9c3e513e668093ab7cb246febbb7f6ac7796d37e1189db565'
)

prepare () {
  cd "$srcdir/$_pkgname"
}

pkgver(){
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$_pkgname/web"
  yarn
  yarn build
  cp -r "dist" "$srcdir/$_pkgname/server/"
  cd "$srcdir/$_pkgname"
  go build -o memos ./main.go
}


package () {
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/${_pkgname}.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -vDm644 memos.conf "$pkgdir/etc/memos.conf"

  cd "$_pkgname"
  install  -Dm755 "memos" "$pkgdir/usr/bin/memos"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"

}
