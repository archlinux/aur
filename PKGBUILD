# Maintainer: rtXrtXrtX <goreshit9999@gmail.com>
# Contributor: rtXrtXrtX <goreshit9999@gmail.com>

pkgname=sysadmin-vim
pkgver=1.0.0
pkgrel=2
pkgdesc="Minimalistic yet powerful Vim configuration for sysadmins. Pre-configured with essential plugins and sane defaults."
arch=('any')
url="https://github.com/rtXrtXrtX/sysadmin-vim"
license=('MIT')
depends=('gvim' 'git' 'curl')
optdepends=(
    'python: for YouCompleteMe Python support'
    'nodejs: for YouCompleteMe JavaScript support'
    'go: for YouCompleteMe Go support'
)
makedepends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rtXrtXrtX/sysadmin-vim/archive/v$pkgver.tar.gz")
sha256sums=('1dfaef668078fbbca504bb4cca1f96a4693d460916ed53c33ef8503fb965da99')  # замени на реальную сумму

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Создаём директории
    install -dm755 "$pkgdir/etc/sysadmin-vim"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    
    # Копируем конфиги
    install -Dm644 vimrc "$pkgdir/etc/sysadmin-vim/vimrc"
    
    # Копируем документацию
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/doc/$pkgname/LICENSE"
    install -Dm644 startpage.txt "$pkgdir/etc/sysadmin-vim/startpage.txt"

    # ---- УСТАНОВКА VIM-PLUG ----
    # Создаём директорию для autoload в системной папке Vim
    install -dm755 "$pkgdir/usr/share/vim/vimfiles/autoload"
    
    # Скачиваем vim-plug
    curl -fLo "$pkgdir/usr/share/vim/vimfiles/autoload/plug.vim" \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # ---------------------------
    
    # Скрипт-установщик (обновлённый)
    cat > "$pkgdir/usr/bin/install-sysadmin-vim" << 'EOF'
#!/bin/bash
echo "Installing sysadmin-vim configuration..."

# Копируем конфиг
cp /etc/sysadmin-vim/vimrc ~/.vimrc

# Создаём директорию для autoload, если её нет
mkdir -p ~/.vim/autoload

# Создаём симлинк на системный vim-plug
ln -sf /usr/share/vim/vimfiles/autoload/plug.vim ~/.vim/autoload/plug.vim

echo "Done! Run vim and execute :PlugInstall"
EOF
    chmod +x "$pkgdir/usr/bin/install-sysadmin-vim"
}
