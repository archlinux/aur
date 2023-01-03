# Maintainer: robertoszek <robertoszek@robertoszek.xyz>
pkgname=python-pleroma-bot
_name=${pkgname#python-}
pkgver=1.2.0
pkgrel=2
pkgdesc="Bot for mirroring one or multiple Twitter accounts in Pleroma/Mastodon."
arch=("any")
url="https://github.com/robertoszek/$_name"
license=("MIT")
depends=("python")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
backup=("etc/pleroma-bot/config.yml" "usr/lib/systemd/system/pleroma-bot.service")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("e631ea34789171b9dd89a4acf1faf2c6309444f64efc5009dbc068bfcced1223")

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  # python setup.py build
  python -m setuptools.launch setup.py build
}

package() {
  depends=("python-oauthlib" "python-requests-oauthlib" "python-requests" "python-pyaml" "python-tqdm" "python-beautifulsoup4" "python-feedparser")
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
  mkdir -p "${pkgdir}/var/log/pleroma-bot"
  install -Dm 600 "${srcdir}/${_name}-${pkgver}/config-minimal.yml.sample" ${pkgdir}/etc/pleroma-bot/config.yml
  install -Dm 644 "${srcdir}/${_name}-${pkgver}/pleroma-bot.service" "${pkgdir}/usr/lib/systemd/system/pleroma-bot.service"
}

