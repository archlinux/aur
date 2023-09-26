# Maintainer: Lindsay Zhou <i@lin.moe>

_pkgname="memos"
pkgname="${_pkgname}-git"
pkgver=0.15.2.r4.g85ed0202
pkgrel=1
pkgdesc="A lightweight, self-hosted memo hub. Open Source and Free forever."
url="https://github.com/usememos/${_pkgname}"
arch=("any")
license=('MIT')
makedepends=("go" "git" "buf" "nodejs")
provides=("$pkgname")
backup=('etc/memos.conf')
source=(
  "git+https://github.com/usememos/$_pkgname.git"
  "systemd.service"
  "sysusers.conf"
  "memos.conf"
  'tmpfiles.conf'
)
sha512sums=('SKIP'
            '9c37361974d8b3beecdd8b0bf8db929a4a882623ea7b23aa51bddf37790b66042cef593d6da89b34e7dde4a9a9a1e097ea31ec713b33fee6a699448fb300d4a2'
            '692dc4674b86b36c5464c78f493ace50091068f962d40130a32b4ed17517d77e33860333e870f5e80a5e17b6cbd5de45bf57e7de5ea7984bd4e36f95a8daf0fa'
            'd529a5d48624848650268db4f0d1f2247507f7c8ee3541b52c235dd72861cfaede59d0752ae67776ca42b0fb3d5951db7b760a9fe7d47149c994d9cefb4af67f'
            'cf88b91a88825dcfda35f45461513b8a2e03b07890189fd1cf7b60aa4085c9e88d8338596b69a3d9c3e513e668093ab7cb246febbb7f6ac7796d37e1189db565')

pkgver(){
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build(){
    # generate protobuf
    cd "$srcdir/$_pkgname/proto" && buf generate

    # build frontend
    cd "$srcdir/$_pkgname/web"
    mkdir -p "$srcdir/bin"
    corepack enable --install-directory "$srcdir/bin"
    
    export PATH="$PATH:$srcdir/bin"
    pnpm i --frozen-lockfile
    pnpm build
    cp -r "dist" "$srcdir/$_pkgname/server/"

    # build backend
    cd "$srcdir/$_pkgname"
    CGO_ENABLED=0 go build -o memos ./main.go
}

check(){
    cd "$srcdir/$_pkgname"
    go test ./...
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
