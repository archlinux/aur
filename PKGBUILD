# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=matrix-reminder-bot
pkgname=python-matrix-reminder-bot
pkgver=0.4.0
pkgrel=1
pkgdesc="Matrix bot to remind you about stuff."
url="https://github.com/anoadragon453/matrix-reminder-bot"
depends=('python' 'python-matrix-nio' 'python-markdown' 'python-yaml'
         'python-dateparser' 'python-readabledelta' 'python-apscheduler' 'python-pytz'
         'python-arrow' 'python-pretty-cron')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-psycopg2: PostgreSQL storage backend'
            'python-olm: end-to-end encryption support')
license=('Apache')
arch=('any')
backup=('etc/matrix-reminder-bot/config.yaml')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/anoadragon453/${_pkgname}/archive/v${pkgver}.tar.gz"
        "matrix-reminder-bot.service"
        "python314-event-loop.patch")

sha256sums=('cc39565fc35a229714a67f84b5b5cab3235780641f2952ee41f15004da450704'
            'ed58a6cb4c10418dfd32a306eba2a22909858881c2bb73eb49cbf7ecaad7bf7e'
            '1d8822c92fce59de8dc44d17f6cf4f0ab4ef95fa463b346ddeb8f6f71fc1d629')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/python314-event-loop.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    install -Dm644 ${_pkgname}.service "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 sample.config.yaml ${pkgdir}/etc/${_pkgname}/config.yaml
}
