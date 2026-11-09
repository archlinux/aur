# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=hindsight-api
pkgver=1.2.0
pkgrel=1
pkgdesc="Agent memory system: retain, recall and reflect server (slim, ONNX embeddings)"
arch=('x86_64')
url="https://hindsight.vectorize.io"
license=('MIT')
depends=('python')
makedepends=('uv')
optdepends=(
  'postgresql: external database backend'
  'pgvector: vector similarity extension, required by postgresql'
)
install=hindsight-api.install
source=(
  'hindsight-api.service'
  'hindsight-api.env.example'
  'LICENSE'
)
sha256sums=('3d4387854567071c3a40e1d4dc1681851d9c6d480ba1cffb678f7ae122ecc64a'
            '64ce64a2751e72d720f0303bd21d9bc4f372c4611ecf97e0c2060eb6125d46e0'
            'b5fa62099f279b85758e746fb4e20f7840f9009bebc6730d3e510918ca2ce3d8')

build() {
  # The venv is created here and shipped whole, so the API and its 180-odd
  # dependencies are version-locked together at package build time.
  uv venv --clear --python /usr/bin/python3.14 venv
  uv pip install --python venv/bin/python \
    "hindsight-api-slim[local-onnx]==${pkgver}" flashrank
}

package() {
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"
  cp -a venv "$_optdir/"

  # Console scripts and activate scripts embed the build path in their shebangs.
  # Skip symlinks: sed -i would replace the python symlink with a regular file.
  for _f in "$_optdir"/venv/bin/*; do
    [ -L "$_f" ] || sed -i "s|$srcdir/venv|/opt/$pkgname/venv|g" "$_f"
  done

  install -d "$pkgdir/usr/bin"
  for _s in hindsight-api hindsight-admin hindsight-worker; do
    ln -s "/opt/$pkgname/venv/bin/$_s" "$pkgdir/usr/bin/$_s"
  done

  # uv's own venv bookkeeping, not part of the installed payload.
  rm -f "$_optdir"/venv/.gitignore "$_optdir"/venv/.lock "$_optdir"/venv/CACHEDIR.TAG

  install -Dm644 hindsight-api.service "$pkgdir/usr/lib/systemd/user/hindsight-api.service"
  install -Dm644 hindsight-api.env.example "$pkgdir/usr/share/$pkgname/hindsight-api.env.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
