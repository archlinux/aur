# Maintainer: Aaron Coach <aur@awc.id.au>

pkgname=yamtrack
pkgver=0.24.11
pkgrel=2
pkgdesc="Self-hosted media tracker"
arch=('any')
url="https://github.com/FuzzyGrim/Yamtrack"
license=('AGPL3')
depends=('python' 'valkey')
makedepends=('python-pip')
backup=('etc/yamtrack/yamtrack.env')
install="${pkgname}.install"
provides=("yamtrack=${pkgver}")
conflicts=("yamtrack-git")
optdepends=("nginx: reverse proxy" "caddy: reverse proxy" "traefik: reverse proxy")

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/FuzzyGrim/Yamtrack/archive/refs/tags/v${pkgver}.tar.gz"
  "0001-arch-state-dir-and-whitenoise.patch"
  "yamtrack.sysusers"
  "yamtrack.env"
  "yamtrack.version.env"
  "yamtrack.target"
  "yamtrack-init.service"
  "yamtrack-web.service"
  "yamtrack-celery.service"
  "yamtrack-celery-beat.service"
  "yamtrack-manage"
)

sha256sums=('b6516defa8dad9f857a8ca4b8108f4c952b158fd950d1d89ecc0813dc6b1ebc1'
            '491b49f33107a36727db4fd181b5f1da1d43a564737a3656d90d3acc22816a36'
            'b802edf0f341b2ec008eedb79b1f4b4c7cec4b89428765a20fa6dd5db30e3a48'
            '1caecf3ac52fd3c0a9c2ada54d4130aba03ff454185c6b10f04f4cf514c4a3b7'
            'cf0f5da164ef6effe5f68db54ac6a2511dd48856106d34d5235ab04a13081ae3'
            '7ad310f36c7d57f76ca3a372221965542c6d42e8746c4aba49716485d5c35f64'
            '1125e574124897c9c6bf982a5b27202d061efd9b3cac3629dded6c94c57234c3'
            '04492abfefd01255f04a69283c0b7fc0aeb74acf9da6800fa03911b40993a279'
            'a2f327de85fb056a32a7127e55433ca3c2a589c4692d288b73250bf3ea940845'
            '35b59935a9d64f221a4f09691b31edb4a1167d2ea6c2e1b419730ef64c48f57e'
            '5d7a844bee1a56c367d115c905b2668283c513029a3894ac761e39de7ba2b24d')

prepare() {
  cd "Yamtrack-${pkgver}"

  # Patch to support YAMTRACK_DATA_DIR for writable state and whitenoise for static files.
  patch -p1 -i ../0001-arch-state-dir-and-whitenoise.patch
}

build() {
  cd "Yamtrack-${pkgver}"

  python -m venv venv
  venv/bin/python -m pip install --upgrade pip setuptools wheel

  # Install pinned runtime deps into the venv.
  venv/bin/pip install --no-cache-dir -r requirements.txt

  # Add whitenoise for serving static files.
  venv/bin/pip install --no-cache-dir "whitenoise==6.11.0"
}

package() {
  cd "Yamtrack-${pkgver}"

  install -d "${pkgdir}/usr/share/yamtrack"
  cp -a src "${pkgdir}/usr/share/yamtrack/src"

  install -d "${pkgdir}/usr/lib/yamtrack"
  cp -a venv "${pkgdir}/usr/lib/yamtrack/venv"

  install -d "${pkgdir}/usr/lib/sysusers.d"
  install -m 0644 "${srcdir}/yamtrack.sysusers" "${pkgdir}/usr/lib/sysusers.d/yamtrack.conf"

  install -d "${pkgdir}/etc/yamtrack"
  install -m 0644 "${srcdir}/yamtrack.env" "${pkgdir}/etc/yamtrack/yamtrack.env"

  sed "s|@PKGVER@|${pkgver}-${pkgrel}|" \
    "${srcdir}/yamtrack.version.env" >"${srcdir}/yamtrack.version.env.built"

  install -Dm0644 "${srcdir}/yamtrack.version.env.built" \
    "${pkgdir}/usr/lib/yamtrack/version.env"

  install -d "${pkgdir}/usr/lib/systemd/system"
  install -m 0644 "${srcdir}/yamtrack.target" "${pkgdir}/usr/lib/systemd/system/yamtrack.target"
  install -m 0644 "${srcdir}/yamtrack-init.service" "${pkgdir}/usr/lib/systemd/system/yamtrack-init.service"
  install -m 0644 "${srcdir}/yamtrack-web.service" "${pkgdir}/usr/lib/systemd/system/yamtrack-web.service"
  install -m 0644 "${srcdir}/yamtrack-celery.service" "${pkgdir}/usr/lib/systemd/system/yamtrack-celery.service"
  install -m 0644 "${srcdir}/yamtrack-celery-beat.service" "${pkgdir}/usr/lib/systemd/system/yamtrack-celery-beat.service"

  install -Dm0755 "${srcdir}/yamtrack-manage" "${pkgdir}/usr/bin/yamtrack-manage"

  install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
