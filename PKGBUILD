# Maintainer: Holo-Q <hello@holo-q.dev>

pkgname=deepseek-responses-proxy-git
_pkgname=deepseek-responses-proxy
pkgver=0.1.0.r16.gb328277
pkgrel=1
pkgdesc="Local Responses API shim for Codex custom providers backed by Chat Completions upstreams"
arch=("any")
url="https://github.com/holo-q/deepseek-responses-proxy"
license=("LicenseRef-All-Rights-Reserved")
depends=("python")
makedepends=("git" "python-installer" "uv")
provides=("deepseek-responses-proxy")
conflicts=("deepseek-responses-proxy")
install="${_pkgname}.install"
source=("git+${url}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_pkgname}"

  local project_version commit_count commit_hash
  project_version="$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])')"
  commit_count="$(git rev-list --count HEAD)"
  commit_hash="$(git rev-parse --short HEAD)"

  printf "%s.r%s.g%s" "${project_version}" "${commit_count}" "${commit_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"
  uv build --wheel
}

check() {
  cd "${srcdir}/${_pkgname}"
  PYTHONPATH=src python -m unittest discover -s tests -p "test*.py"
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 contrib/systemd/deepseek-responses-proxy.service \
    "${pkgdir}/usr/lib/systemd/user/deepseek-responses-proxy.service"
  sed -i \
    "s|ExecStart=.*|ExecStart=/usr/bin/deepseek-responses-proxy --bind 127.0.0.1 --port 8787 --chat-base-url https://api.deepseek.com --api-key-pass api-keys/deepseek|" \
    "${pkgdir}/usr/lib/systemd/user/deepseek-responses-proxy.service"
}
