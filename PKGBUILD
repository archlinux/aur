pkgname=3dgenstudio-git
pkgver=r8d4b6a2
pkgrel=2
pkgdesc="AI image-to-3D model generation studio (Vite UI + Node/Python backend)"
arch=(x86_64)
url="https://github.com/visualbruno/3DGenStudio"
license=(custom)
depends=("nodejs")
makedepends=("git" "npm")
optdepends=("python: local 3D-generation backend (python-server)")
conflicts=("3dgenstudio")
provides=("3dgenstudio")

source=("3dgenstudio-git::git+https://github.com/visualbruno/3DGenStudio.git#branch=main")
sha256sums=('SKIP')

pkgver() {
cd "$srcdir/3dgenstudio-git"
printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
# Production build (vite build -> dist/)
cd "$srcdir/3dgenstudio-git"
npm ci
npm run build
# Strip devDependencies from node_modules
cd "$srcdir/3dgenstudio-git"
npm prune --omit=dev
}

package() {
# Install production tree
cd "$srcdir/3dgenstudio-git"
install -d "$pkgdir/opt/3dgenstudio-git"
cp -a --no-target-directory . "$pkgdir/opt/3dgenstudio-git"
# Keep the production build + server; drop dev source, tooling, VCS, secrets.
cd "$pkgdir/opt/3dgenstudio-git"
rm -rf .git .env src public .github .vscode .claude .gitignore \
       vite.config.* eslint.config.js tsconfig*.json
# Install launcher
install -d "$pkgdir/usr/bin"
base64 -d > "$pkgdir/usr/bin/3dgenstudio" <<< "IyEvYmluL2Jhc2gKIyBSdW5zIHRoZSBwcm9kdWN0aW9uIHNlcnZlciAoc2VydmVyLmpzKTogc2VydmVzIHRoZSBidWlsdCBkaXN0LyBVSSArIEFQSXMKIyBvbiBodHRwOi8vbG9jYWxob3N0OiR7UE9SVDotMzAwMX0uIEFwcCBkYXRhIChzcWxpdGUsIGFzc2V0cykgaXMgd3JpdHRlbgojIHVuZGVyIHByb2Nlc3MuY3dkKCkvZGF0YSwgc28gcnVuIGZyb20gYSBwZXItdXNlciB3cml0YWJsZSBkaXJlY3RvcnkuCnNldCAtZQphcHA9L29wdC8zZGdlbnN0dWRpby1naXQKZGF0YT0iJHtYREdfREFUQV9IT01FOi0kSE9NRS8ubG9jYWwvc2hhcmV9LzNkZ2Vuc3R1ZGlvIgpta2RpciAtcCAiJGRhdGEiCmNkICIkZGF0YSIKZWNobyAiM2RnZW5zdHVkaW86IG9wZW4gaHR0cDovL2xvY2FsaG9zdDoke1BPUlQ6LTMwMDF9IgpleGVjIG5vZGUgIiRhcHAvc2VydmVyLmpzIg=="
chmod 755 "$pkgdir/usr/bin/3dgenstudio"
}