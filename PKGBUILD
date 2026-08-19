# Maintainer: lucas007 <lucaszhou007@163.com>
_pkg_groupname="mozhi"
_commit_hash='095c73f04bc24f51dcb4a0155a5f10f87f768a8c'
pkgname="mozhi-git"
pkgver=r243.095c73f
pkgrel=1
provides=('mozhi')
conflicts=('mozhi' 'mozhi-bin')
pkgdesc="Alternative frontend for multiple translation engines, a maintained fork‑rewrite of SimplyTranslate‑Web with API, webapp and CLI support"
arch=('any')
url="https://codeberg.org/aryak/mozhi"
license=('GNU')
source=(
"git+https://codeberg.org/aryak/mozhi.git#commit=${_commit_hash}"
"mozhi-server.service"
"mozhi-server.sysusers"
)
sha256sums=('3b10a63e7cdeb44ece88940600abbeecbb7631fcb4a34b6c887d98889b3a6976'
            'b2c186227e9d3633a2313336ebdd51f5a88d56ed95db3203c0038b87706d669f'
            'da0d865d56bc7a183c0c5925f22070e12c3a5614cfcf48b5d55d5ce7a4e7279a')
options=(!strip !debug)
pkgver() {
  cd "${_pkg_groupname}" || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
prepare() {
  cd "$_pkg_groupname" || exit
  export GOPRIVATE=codeberg.org/aryak/libmozhi
  go mod download -modcacherw
  go run github.com/swaggo/swag/cmd/swag@latest init --parseDependency
}

build(){
  cd "$_pkg_groupname" || exit
  go build -o mozhi
}

package() {
  install -D -m644 "$_pkg_groupname/LICENSE" "$pkgdir/usr/share/licenses/$_pkg_groupname/LICENSE"
  install -Dm755 $_pkg_groupname/mozhi "${pkgdir}/usr/bin/mozhi"
  install -Dm644 "mozhi-server.service" "$pkgdir/usr/lib/systemd/system/mozhi-server.service"
  install -Dm644 "mozhi-server.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkg_groupname.conf"
}

# makepkg -g
# updpkgsums
# makepkg -sf
# makepkg --printsrcinfo > .SRCINFO