# Maintainer: Vladislav Malygin <vlad.malygin.02@gmail.com>
# Contributor: Vladislav Malygin <vlad.malygin.02@gmail.com>

pkgname=dfsort
pkgver=1.0.0
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
    'file'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
    'git'
)
optdepends=(
    'python-schedule: для интервального режима работы'
    'python-croniter: для cron-расписания'
    'python-questionary: для интерактивного конфигуратора'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/vladislavmalygin/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=('SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # Проверяем наличие setup.py без использования error
    if [ ! -f "setup.py" ]; then
        printf "Ошибка: setup.py не найден в %s\n" "$PWD"
        exit 1
    fi
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    # Простая проверка импорта
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

    # Устанавливаем README если есть
    if [ -f "README.md" ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi

    # Создаём директорию для логов
    install -dm755 "$pkgdir/var/log/$pkgname"
}

post_install() {
    echo "=================================================="
    echo "DFSORT успешно установлен!"
    echo "=================================================="
    echo ""
    echo "📦 Основные зависимости установлены:"
    echo "  • python-watchdog - мониторинг файлов"
    echo "  • python-yaml - работа с конфигами"
    echo "  • python-magic - определение MIME-типов"
    echo ""
    echo "🔧 Дополнительные возможности (опционально):"
    echo "  Для интервального режима:   sudo pacman -S python-schedule"
    echo "  Для cron-расписания:        sudo pacman -S python-croniter"
    echo "  Для конфигуратора:          sudo pacman -S python-questionary"
    echo ""
    echo "⚙️  Быстрый старт:"
    echo "  1. Запустите конфигуратор: dfsort --configure"
    echo "  2. Или отредактируйте конфиг: nano /etc/dfsort/config.yaml"
    echo "  3. Запустите сортировку: dfsort -o"
    echo ""
    echo "🚀 Для работы как демон:"
    echo "  systemctl --user enable dfsort.service"
    echo "  systemctl --user start dfsort.service"
    echo ""
    echo "📝 Логи: ~/.local/share/dfsort/dfsort.log"
    echo "📂 Конфиг: /etc/dfsort/config.yaml"
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