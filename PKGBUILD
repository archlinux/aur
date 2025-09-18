# Maintainer: Pombaa <your-email@example.com>
pkgname=ambiente-backup
pkgver=1.2.1
pkgrel=1
pkgdesc="Sistema completo de backup e restauração de ambiente Linux com interface gráfica"
arch=('any')
url="https://github.com/Pombaa/Backup-e-restaurador-de-ambiente"
license=('MIT')
depends=(
    'bash'
    'zenity'
    'tar'
    'gzip'
    'xz'
    'zstd'
    'rsync'
    'pacman'
)
optdepends=(
    'git: para backup de repositórios git'
    'python: para scripts Python incluídos'
    'php: para backup de configurações PHP'
    'apache: para backup de configurações Apache'
    'nginx: para backup de configurações Nginx'
)
source=("git+https://github.com/Pombaa/Backup-e-restaurador-de-ambiente.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/Backup-e-restaurador-de-ambiente"
    
    # Criar diretórios
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/ambiente-backup"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/doc/ambiente-backup"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # Instalar scripts principais
    install -Dm755 ambiente-gui.sh "$pkgdir/usr/share/ambiente-backup/"
    install -Dm755 backup-completo.sh "$pkgdir/usr/share/ambiente-backup/"
    install -Dm755 backup-gui.sh "$pkgdir/usr/share/ambiente-backup/"
    install -Dm755 restaurar-ambiente.sh "$pkgdir/usr/share/ambiente-backup/"
    install -Dm755 restore-gui.sh "$pkgdir/usr/share/ambiente-backup/"
    install -Dm755 relatorio-pacotes.sh "$pkgdir/usr/share/ambiente-backup/"
    
    # Criar comando principal no PATH
    cat > "$pkgdir/usr/bin/ambiente-backup" << 'EOF'
#!/usr/bin/env bash
# Wrapper script para ambiente-backup
exec /usr/share/ambiente-backup/ambiente-gui.sh "$@"
EOF
    chmod +x "$pkgdir/usr/bin/ambiente-backup"
    
    # Comandos alternativos intuitivos
    ln -s ambiente-backup "$pkgdir/usr/bin/backup-ambiente"
    ln -s ambiente-backup "$pkgdir/usr/bin/backup-restore"
    
    # Comandos específicos
    cat > "$pkgdir/usr/bin/backup-env" << 'EOF'
#!/usr/bin/env bash
exec /usr/share/ambiente-backup/backup-gui.sh "$@"
EOF
    chmod +x "$pkgdir/usr/bin/backup-env"
    
    cat > "$pkgdir/usr/bin/restore-env" << 'EOF'
#!/usr/bin/env bash
exec /usr/share/ambiente-backup/restore-gui.sh "$@"
EOF
    chmod +x "$pkgdir/usr/bin/restore-env"
    
    # Instalar arquivo .desktop
    install -Dm644 sistema-backup.desktop "$pkgdir/usr/share/applications/ambiente-backup.desktop"
    
    # Documentação
    install -Dm644 README.md "$pkgdir/usr/share/doc/ambiente-backup/"
    
    # Licença (criar se não existir)
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
    else
        echo "MIT License - see project repository" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}