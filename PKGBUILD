# Maintainer: Vladislav Malygin <vlad.malygin.02@gmail.com>

pkgname=dfsort
pkgver=1.0.3
pkgrel=1
pkgdesc="File Auto-Sorter - автоматическая сортировка файлов с поддержкой правил, расписания и интерактивного конфигуратора"
arch=('any')
url="https://github.com/vladislavmalygin/dfsort"
license=('MIT')
depends=(
    'python'
    'python-watchdog'
    'python-yaml'
    'python-magic'
    'python-six'
    'python-wcwidth'
    'python-prompt_toolkit'
    'python-pygments'
    'python-questionary'
    'python-schedule'
    'python-croniter'
    'file'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vladislavmalygin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    if [ ! -f "setup.py" ]; then
        printf "Ошибка: setup.py не найден\n"
        exit 1
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    python -c "import dfsort; print('Module loaded successfully')" || {
        printf "Ошибка: не удалось импортировать модуль dfsort\n"
        exit 1
    }
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Устанавливаем Python-пакет
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Устанавливаем конфиг
    install -Dm644 config/config.yaml "$pkgdir/etc/dfsort/config.yaml"

    # Устанавливаем systemd-юнит
    install -Dm644 systemd/dfsort.service "$pkgdir/usr/lib/systemd/user/dfsort.service"

    # Устанавливаем документацию
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}

post_install() {
    echo "=================================================="
    echo "✅ DFSORT успешно установлен!"
    echo "=================================================="
    echo ""
    echo "📦 Версия: 1.0.2"
    echo "📂 Конфиг: /etc/dfsort/config.yaml"
    echo "🚀 Команда: dfsort"
    echo ""
    echo "⚙️  Настройка: dfsort --configure"
    echo "🔄 Запуск демона: systemctl --user start dfsort"
    echo "=================================================="
}
