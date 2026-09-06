pkgname=3dgenstudio-git
pkgver=re2350b8
pkgrel=1
pkgdesc="AI image-to-3D model generation studio (Vite UI + Node/Python backend)"
arch=(x86_64)
url="https://github.com/visualbruno/3DGenStudio"
license=(custom)
depends=("nodejs" "xdg-utils")
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
base64 -d > "$pkgdir/usr/bin/3dgenstudio" <<< "IyEvYmluL2Jhc2gKIyBTdGFydHMgdGhlIHByb2R1Y3Rpb24gc2VydmVyIChzZXJ2ZXMgdGhlIGJ1aWx0IGRpc3QvIFVJICsgQVBJcykgYW5kIG9wZW5zIGl0CiMgaW4gdGhlIGJyb3dzZXIuIElmIGl0J3MgYWxyZWFkeSBydW5uaW5nLCBqdXN0IG9wZW5zIHRoZSBicm93c2VyLiBBcHAgZGF0YQojIChzcWxpdGUsIGFzc2V0cykgaXMgd3JpdHRlbiB1bmRlciBwcm9jZXNzLmN3ZCgpL2RhdGEg4oCUIGEgcGVyLXVzZXIgd3JpdGFibGUgZGlyLgphcHA9L29wdC8zZGdlbnN0dWRpby1naXQKZGF0YT0iJHtYREdfREFUQV9IT01FOi0kSE9NRS8ubG9jYWwvc2hhcmV9LzNkZ2Vuc3R1ZGlvIgpwb3J0PSIke1BPUlQ6LTMwMDF9Igp1cmw9Imh0dHA6Ly9sb2NhbGhvc3Q6JHBvcnQiCm1rZGlyIC1wICIkZGF0YSIKY2QgIiRkYXRhIgpfdXAoKSB7IChleGVjIDM8PiIvZGV2L3RjcC8xMjcuMC4wLjEvJHBvcnQiKSAyPi9kZXYvbnVsbDsgfQppZiBfdXA7IHRoZW4gZXhlYyB4ZGctb3BlbiAiJHVybCI7IGZpCiggZm9yIF8gaW4gJChzZXEgMSA1MCk7IGRvIF91cCAmJiB7IHhkZy1vcGVuICIkdXJsIjsgYnJlYWs7IH07IHNsZWVwIDAuMjsgZG9uZSApICYKZWNobyAiM2RnZW5zdHVkaW86IHN0YXJ0aW5nIG9uICR1cmwiCmV4ZWMgbm9kZSAiJGFwcC9zZXJ2ZXIuanMi"
chmod 755 "$pkgdir/usr/bin/3dgenstudio"
# Install menu entry + icon
install -d "$pkgdir/usr/share/applications"
printf '%s\n' \
  '[Desktop Entry]' \
  'Type=Application' \
  'Name=3D Gen Studio' \
  'Comment=AI image-to-3D model generation studio' \
  'Exec=3dgenstudio' \
  'Icon=3dgenstudio' \
  'Terminal=false' \
  'Categories=Graphics;3DGraphics;' \
  > "$pkgdir/usr/share/applications/3dgenstudio.desktop"

install -Dm644 "$srcdir/3dgenstudio-git/dist/favicon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/3dgenstudio.png"
}