pkgname=3dgenstudio-git
pkgver=r8d4b6a2
pkgrel=1
pkgdesc="AI image-to-3D model generation studio (Vite frontend + Python backend)"
arch=(x86_64)
url="https://github.com/visualbruno/3DGenStudio"
license=(custom)
depends=("nodejs" "python")
makedepends=("git" "npm")
conflicts=("3dgenstudio")
provides=("3dgenstudio")

source=("3dgenstudio-git::git+https://github.com/visualbruno/3DGenStudio.git#branch=main")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/3dgenstudio-git"
printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
# Build frontend
export NODE_ENV="production"
cd "$srcdir/3dgenstudio-git"
npm ci
npm run build
}

package() {
# Install app tree
cd "$srcdir/3dgenstudio-git"
install -d "$pkgdir/opt/3dgenstudio-git"
cp -a dist python-server server.js package.json package-lock.json "$pkgdir/opt/3dgenstudio-git/"
# Drop bundled .env
rm -f "$pkgdir/opt/3dgenstudio-git/.env"
# Install launcher
install -d "$pkgdir/usr/bin"
base64 -d > "$pkgdir/usr/bin/3dgenstudio" <<< "IyEvYmluL2Jhc2gKIyBGaXJzdCBydW4gYm9vdHN0cmFwcyBhIHBlci11c2VyIHZlbnYgZm9yIHRoZSBQeXRob24gYmFja2VuZCwgdGhlbiBzdGFydHMKIyB0aGUgYmFja2VuZCBhbmQgdGhlIE5vZGUgZnJvbnRlbmQgc2VydmVyIHRvZ2V0aGVyLgpzZXQgLWUKYXBwPS9vcHQvM2RnZW5zdHVkaW8tZ2l0CmRhdGE9IiR7WERHX0RBVEFfSE9NRTotJEhPTUUvLmxvY2FsL3NoYXJlfS8zZGdlbnN0dWRpbyIKdmVudj0iJGRhdGEvLnZlbnYiCm1rZGlyIC1wICIkZGF0YSIKaWYgWyAhIC14ICIkdmVudi9iaW4vcHl0aG9uIiBdOyB0aGVuCiAgICBlY2hvICIzZGdlbnN0dWRpbzogc2V0dGluZyB1cCBQeXRob24gYmFja2VuZCAoZmlyc3QgcnVuKS4uLiIKICAgIHB5dGhvbiAtbSB2ZW52ICIkdmVudiIKICAgICIkdmVudi9iaW4vcGlwIiBpbnN0YWxsIC0tdXBncmFkZSBwaXAKICAgICIkdmVudi9iaW4vcGlwIiBpbnN0YWxsIC1yICIkYXBwL3B5dGhvbi1zZXJ2ZXIvcmVxdWlyZW1lbnRzLnR4dCIKZmkKY2QgIiRhcHAiCiIkdmVudi9iaW4vcHl0aG9uIiBweXRob24tc2VydmVyL21haW4ucHkgJgpiYWNrZW5kPSQhCnRyYXAgJ2tpbGwgJGJhY2tlbmQgMj4vZGV2L251bGwnIEVYSVQKZXhlYyBub2RlIHNlcnZlci5qcw=="
chmod 755 "$pkgdir/usr/bin/3dgenstudio"
}