# Maintainer: Thr0TT1e <info@noble24.ru>

_themename=russia
pkgname=plymouth-theme-$_themename
pkgver=1.1.1
pkgrel=3
pkgdesc="Russia coat of arms splash screen for Plymouth"
arch=('any')
url="https://codeberg.org/Thr0TT1e/russia-theme-plymouth.git"
license=('LGPL-3.0-only')
depends=('plymouth')
install="$pkgname.install"
makedepends=('git')
source=(
    "$pkgname::git+$url#tag=v$pkgver"
    "$pkgname.install"
    'AUTHORS'
    'LICENSE'
    'README.md'
)

# Рекомендуется использовать sha256sums или b2sums для всех файлов, включая .install
b2sums=('7cfc867ae806b04c2b10ac07e314d1ec6aea97f508c20aa315e01ba215319e17cd67972a240f30ddd864f1cc6785d63c3e2ffddb33c950a4d97f8a2a17fe8cb9'
        '7b526932bcafa11a993a5ca2af56988631d3ec0cfd717d173fb780ba835c40fff6ff8ad1440423d18f02abcf648bdca26a253ece6681428fed8f24a31fa7a8ec'
        '9a0de88ddd5a8ccea0ca8cefba88b57caae975fe6b6ff878aefb8479002751325afc38a89b062f6486b6110e3fcdf8814ed16b01e0efea444e11a18086c5f1fb'
        '74381aad2f4232b9ab8834245f2132805bdd0bea713ad5f47b2c47d68a469cf26b7d7a0c02678ff9bc08bfb178de0d54915f67a950db1e47455b10e83d55efaf'
        'c368a0b4921fb2062e96d6314094a3fb1811bf611b4f356105bd00b70baa1fc4868db7487b2128e844b157ea48abfa094663f6bf17ab4d966692803cf793e045')

check() {
    cd "$srcdir/$pkgname" || return 1

    msg "=== Отладка: содержимое директории $PWD ==="
    ls -la
    msg "============================================"

    # Безопасное обращение к переменным через ${_themename}
    for required in "${_themename}.plymouth" "${_themename}.script"; do
        if [[ ! -f "$required" ]]; then
            error "Missing required file: $required"
            return 1
        fi
    done

    # Включаем игнорирование регистра (на случай .PNG) и nullglob
    shopt -s nullglob nocaseglob
    local images=(*.png *.svg)
    shopt -u nullglob nocaseglob

    if [[ ${#images[@]} -eq 0 ]]; then
        warning "No PNG or SVG images found in the root of the theme directory."
        warning "Check if they are in a subfolder or have different extensions."
    else
        msg "Successfully found images: ${images[*]}"
    fi
}

prepare() {
    cd "$srcdir/$pkgname" || return 1

    if [[ -f "${_themename}.script" ]]; then
        if grep -qE "(screenHeight|GetHeight)" "${_themename}.script"; then
            msg "HiDPI resolution handling detected in script"
        else
            warning "Theme script may lack explicit HiDPI (2K/4K) scaling logic"
        fi
    fi
}

package() {
    cd "$srcdir/$pkgname" || return 1
    local _themedir="$pkgdir/usr/share/plymouth/themes/${_themename}"

    install -dm755 "$_themedir"

    # Явное и безопасное указание файлов через ${_themename}
    local theme_files=("${_themename}.plymouth" "${_themename}.script")
    
    shopt -s nullglob nocaseglob
    theme_files+=(*.png *.svg)
    shopt -u nullglob nocaseglob

    if [[ ${#theme_files[@]} -gt 0 ]]; then
        msg "Installing theme files: ${theme_files[*]}"
        # -t указывает целевую директорию, что позволяет передать массив файлов
        install -Dm644 -t "$_themedir" "${theme_files[@]}"
    else
        error "No files to install for the theme!"
        return 1
    fi

    # Установка документации и лицензии
    local -a docs=(
        "LICENSE:/usr/share/licenses/$pkgname/LICENSE"
        "README.md:/usr/share/doc/$pkgname/README.md"
        "AUTHORS:/usr/share/doc/$pkgname/AUTHORS"
    )

    for doc_pair in "${docs[@]}"; do
        local src_file="${doc_pair%%:*}"
        local dst_path="$pkgdir/${doc_pair#*:}"
        
        if [[ -f "$srcdir/$src_file" ]]; then
            install -Dm644 "$srcdir/$src_file" "$dst_path"
        else
            warning "Optional file '$src_file' not found in srcdir, skipping."
        fi
    done
}