# Maintainer: Glob876 <gleb87687@gmail.com>
pkgname=mdfu-git
pkgver=r24.e56760b
pkgrel=1
pkgdesc="MogDop File Utils - CLI & Web File Sorter"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('git')
provides=('mdfu')
conflicts=('mdfu')

# Ссылка на репозиторий проекта на GitHub
url="https://github.com/Glob876/MogDop-File-Utils"

# Конструкция "${pkgname%-git}::" принудительно заставляет makepkg склонировать 
# репозиторий в локальную папку "mdfu" внутри директории сборки.
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgname%-git}"

    # 1. Создаем необходимые папки в будущей системе
    install -dm755 "$pkgdir/usr/share/mdfu"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"

    # 2. Копируем всё содержимое скачанного репозитория GitHub в системную папку /usr/share/mdfu
    cp -r * "$pkgdir/usr/share/mdfu/"

    # 3. Безопасное переименование файла с пробелами и скобками во избежание ошибок терминала.
    # Если на GitHub лежит файл "[legacy] mdfu.py", он будет корректно переименован в "legacy_mdfu.py"
    if [ ! -f "$pkgdir/usr/share/mdfu/legacy_mdfu.py" ] && [ -f "$pkgdir/usr/share/mdfu/[legacy] mdfu.py" ]; then
        mv "$pkgdir/usr/share/mdfu/[legacy] mdfu.py" "$pkgdir/usr/share/mdfu/legacy_mdfu.py"
    fi

    # 4. Создаем стартовые исполняемые скрипты (команды) в /usr/bin:

    # а) Команда 'mdfu' -> запускает современную Веб-версию (start_server.py)
    echo -e '#!/bin/sh\ncd /usr/share/mdfu && exec python3 start_server.py "$@"' > "$pkgdir/usr/bin/mdfu"
    chmod 755 "$pkgdir/usr/bin/mdfu"

    # б) Команда 'mdfu-cli' -> запускает современную Консольную версию (cli_main.py)
    echo -e '#!/bin/sh\ncd /usr/share/mdfu && exec python3 cli_main.py "$@"' > "$pkgdir/usr/bin/mdfu-cli"
    chmod 755 "$pkgdir/usr/bin/mdfu-cli"

    # в) Команда 'mdfu-legacy' -> запускает Легаси-версию (legacy_mdfu.py)
    echo -e '#!/bin/sh\ncd /usr/share/mdfu && exec python3 legacy_mdfu.py "$@"' > "$pkgdir/usr/bin/mdfu-legacy"
    chmod 755 "$pkgdir/usr/bin/mdfu-legacy"

    # 5. Создаем .desktop-файл для интеграции легаси-версии в меню приложений.
    # Значение 'Name' задает отображаемое имя в списке ваших приложений.
    # Если легаси-версия консольная, оставьте Terminal=true. Если у нее есть графическое окно, измените на Terminal=false.
    cat <<EOF > "$pkgdir/usr/share/applications/mdfu-legacy.desktop"
[Desktop Entry]
Type=Application
Name=MD File Utils: Sorter
Comment=Legacy Python interface for MogDop File Sorter
Exec=mdfu-legacy
Icon=system-run
Terminal=true
Categories=Utility;System;
EOF
}
