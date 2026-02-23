# Maintainer: Vladislav Malygin <vlad.malygin.02@gmail.com>

pkgname=dfsort
pkgver=1.0.1
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

    # Устанавливаем systemd-юнит (пользовательский)
    install -Dm644 systemd/dfsort.service "$pkgdir/usr/lib/systemd/user/dfsort.service"

    # Устанавливаем пример конфига как документацию
    install -Dm644 config/config.yaml "$pkgdir/usr/share/doc/$pkgname/config.yaml.example"

    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi

    install -dm755 "$pkgdir/var/log/$pkgname"
}

post_install() {
    echo "=================================================="
    echo "✅ DFSORT успешно установлен!"
    echo "=================================================="
    echo ""
    echo "📦 Установленные компоненты:"
    echo "  • Команда: dfsort"
    echo "  • Конфиг: /etc/dfsort/config.yaml"
    echo "  • Юнит: /usr/lib/systemd/user/dfsort.service"
    echo ""
    echo "⚙️  Быстрый старт:"
    echo "  1. Настройте конфиг: dfsort --configure"
    echo "  2. Запустите сортировку: dfsort -o"
    echo "  3. Запустите демон: systemctl --user start dfsort"
    echo ""
    echo "🚀 Для автозапуска демона:"
    echo "  systemctl --user enable dfsort"
    echo "  systemctl --user start dfsort"
    echo ""
    echo "📝 Логи: journalctl --user -u dfsort -f"
    echo "📂 Документация: https://github.com/vladislavmalygin/dfsort"
    echo "=================================================="
}

# Информация для AUR
#contributors:
#  - Vladislav Malygin <vlad.malygin.02@gmail.com>
#keywords:
#  - file-sorter
#  - organizer
#  - watchdog
#  - python
#  - automation