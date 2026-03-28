# Maintainer: Thr0TT1e <info@noble24.ru>

_themename=russia
pkgname=plymouth-theme-$_themename
pkgver=1.1.0
pkgrel=1
pkgdesc="Russia coat of arms splash screen for Plymouth"
arch=("any")
url="https://codeberg.org/Thr0TT1e/russia-theme-plymouth.git"
license=("LGPL-3.0-only")
depends=("plymouth")
install="$pkgname.install"
makedepends=("git")
source=("$pkgname::git+$url"
        "AUTHORS"
        "LICENSE"
        "README.md")
b2sums=('SKIP'
        '9a0de88ddd5a8ccea0ca8cefba88b57caae975fe6b6ff878aefb8479002751325afc38a89b062f6486b6110e3fcdf8814ed16b01e0efea444e11a18086c5f1fb'
        '74381aad2f4232b9ab8834245f2132805bdd0bea713ad5f47b2c47d68a469cf26b7d7a0c02678ff9bc08bfb178de0d54915f67a950db1e47455b10e83d55efaf'
        'c368a0b4921fb2062e96d6314094a3fb1811bf611b4f356105bd00b70baa1fc4868db7487b2128e844b157ea48abfa094663f6bf17ab4d966692803cf793e045')

# Функция для проверки корректности после сборки
check() {
    cd "$srcdir/$pkgname"

    # Проверка наличия обязательных файлов
    for required in "$_themename.plymouth" "$_themename.script"; do
        if [[ ! -f "$required" ]]; then
            error "Missing required file: $required"
            return 1
        fi
    done

    # Проверка, что есть хотя бы один png файл
    if ! compgen -G "*.png" > /dev/null; then
        error "No PNG images found in theme"
        return 1
    fi
}

prepare() {
    cd "$srcdir/$pkgname"

    if [[ -f "$_themename.script" ]]; then
        # Проверка, есть ли поддержка HiDPI в скрипте
        if ! grep -q "screenHeight >= 1200" "$_themename.script"; then
            warning "Theme script may not have HiDPI support for 2K/4K displays"
        fi
    fi
}

package() {
    cd "$srcdir/$pkgname"
    _themedir="$pkgdir/usr/share/plymouth/themes/$_themename"

    # Создание директории темы
    install -dm755 "$_themedir"

    # Копирование файлов темы через массив
    local files_to_copy=(
        "$_themename.plymouth"
        "$_themename.script"
    )

    # Добавление всех png файлов
    shopt -s nullglob
    files_to_copy+=(*.png)
    shopt -u nullglob

    # Копирование каждого файла с явной проверкой
    for file in "${files_to_copy[@]}"; do
        if [[ -f "$file" ]]; then
            install -Dm644 "$file" "$_themedir/$file"
        else
            warning "File not found: $file"
        fi
    done

    # Установка документации (файлы находятся в $srcdir, не в поддиректории!)
    if [[ -f "$srcdir/LICENSE" ]]; then
        install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    else
        warning "LICENSE file not found, skipping"
    fi

    if [[ -f "$srcdir/README.md" ]]; then
        install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    else
        warning "README.md file not found, skipping"
    fi

    if [[ -f "$srcdir/AUTHORS" ]]; then
        install -Dm644 "$srcdir/AUTHORS" "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
    else
        warning "AUTHORS file not found, skipping"
    fi
}
