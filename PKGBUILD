# Maintainer: envolution
# Contributor: Tony Benoy <me@tonybenoy.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=screenpipe
pkgver=0.2.74
pkgrel=3
pkgdesc="24/7 Screen and Audio Capture with AI-powered tools"
arch=('x86_64')
url="https://github.com/mediar-ai/screenpipe"
license=('MIT')
depends=('protobuf' 'onnxruntime' 'ffmpeg' 'tesseract' 'curl' 'libxi' 'libxtst' 'xdo' 'xdotool')
makedepends=('python' 'python-tomlkit' 'rust' 'cargo' 'git' 'cmake')

# current release doesn't build anymore - interim commit was just the latest
_commit='f85c1e5e4b16e15572b520cf714b19e9fb85ecc8'
source=(
  "git+https://github.com/mediar-ai/screenpipe.git#commit=${_commit}"
)
sha256sums=('c7ba8e00564be6d60b2e18b3022989a7bb3eebbd1c97ba3eca294261a3a37b39')

# delicate balance of compile flags as the crate dependency tree is all over the place
_cflags="-std=gnu11 -fpermissive -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
_cxxflags="-std=gnu++11 -fpermissive -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
_cargoconfig=.cargo/config.toml

prepare() {
  cd "$pkgname"
  cargo fetch --target "x86_64-unknown-linux-gnu"

  export RUSTUP_TOOLCHAIN=stable

  # there's probably a better way to modify the config.toml
  # so we can avoid requiring python for building.
  # this just seems the safest atm. I know upstream is
  # modifying [env] and for now we have to ensure it's included
 
  python - <<EOF
import tomlkit

path = "$_cargoconfig"
with open(path, "r", encoding="utf-8") as f:
    doc = tomlkit.parse(f.read())

doc.setdefault("env", {})
doc["env"]["CFLAGS"] = "$_cflags"
doc["env"]["CXXFLAGS"] = "$_cxxflags"
doc["env"]["CMAKE_POLICY_VERSION_MINIMUM"] = "3.5"

with open(path, "w", encoding="utf-8") as f:
    f.write(tomlkit.dumps(doc))
EOF
}

build() {
  cd "$pkgname"
  export CFLAGS=${_cflags}
  export CXXFLAGS=${_cxxflags}
  cargo build --release
}

package() {
  install -Dm755 "$pkgname/target/release/screenpipe" "$pkgdir/usr/bin/screenpipe"
  install -Dm644 "$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
# vim:set ts=2 sw=2 et:
