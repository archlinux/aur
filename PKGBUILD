# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmscope=agentmemory
pkgname=agentmemory
pkgver=0.9.29
pkgrel=1
pkgdesc="Persistent memory for AI coding agents based on real-world benchmarks"
arch=('x86_64')
url="https://github.com/rohitg00/agentmemory"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@$_npmscope/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE::https://raw.githubusercontent.com/rohitg00/agentmemory/v$pkgver/LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=('800309cb9e83ee5efc10739f8b481d79fa5544df'
          '828dcdad822eadebbf9b29e4412b2e7e4b1f68b4')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"

  local _nm="$pkgdir/usr/lib/node_modules/@$_npmscope/$pkgname/node_modules"

  # Transitive deps bundle native binaries for every OS/arch; keep linux-x64 only.
  local d
  for d in "$_nm"/bare-*/prebuilds; do
    [[ -d $d ]] || continue
    find "$d" -mindepth 1 -maxdepth 1 -type d ! -name linux-x64 -exec rm -rf {} +
  done
  for d in "$_nm"/onnxruntime-node/bin/napi-v* \
           "$_nm"/@xenova/transformers/node_modules/onnxruntime-node/bin/napi-v*; do
    [[ -d $d ]] || continue
    find "$d" -mindepth 1 -maxdepth 1 -type d ! -name linux -exec rm -rf {} +
    rm -rf "$d/linux/arm64"
  done

  # The CUDA/TensorRT execution providers dlopen libcuda/libcudnn/libtensorrt,
  # none of which are dependencies; onnxruntime uses the CPU provider by default.
  rm -f "$_nm"/onnxruntime-node/bin/napi-v*/linux/x64/libonnxruntime_providers_{cuda,tensorrt}.so

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  # Some vendored files ship group/world-writable
  find "$pkgdir/usr" -type f -perm /022 -exec chmod go-w {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
