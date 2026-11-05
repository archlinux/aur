# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmscope=agentmemory
pkgname=agentmemory
pkgver=0.9.32
pkgrel=1
pkgdesc="Persistent memory for AI coding agents based on real-world benchmarks"
arch=('x86_64')
url="https://github.com/rohitg00/agentmemory"
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@$_npmscope/$pkgname/-/$pkgname-$pkgver.tgz"
        "LICENSE-$pkgname-$pkgver::https://raw.githubusercontent.com/rohitg00/agentmemory/v$pkgver/LICENSE")
noextract=("$pkgname-$pkgver.tgz")
sha1sums=('cedfdb39acce20b77e92b35fac83ce3ae7b34397'
          '828dcdad822eadebbf9b29e4412b2e7e4b1f68b4')

# npm runs in build(), outside fakeroot: under fakeroot, npm's worker threads and
# faked deadlock on the SysV message queue (all blocked in msgsnd, no CPU, for hours).
build() {
  npm install -g --cache "$srcdir/npm-cache" --no-audit --no-fund --no-update-notifier \
    --prefix "$srcdir/stage/usr" "$srcdir/$pkgname-$pkgver.tgz"
}

package() {
  cp -a "$srcdir/stage/usr" "$pkgdir/"

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

  install -Dm644 "$srcdir/LICENSE-$pkgname-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
