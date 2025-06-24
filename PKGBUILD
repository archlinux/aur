# Maintainer: Pedro Lucas <pedrolucasinvestidor62023@gmail.com>
pkgname=navegadorpytech
pkgver=0.0.2
pkgrel=3
pkgdesc="Um Navegador simples, seguro, leve e privado usando python e desenvolvido usando 100% tecnologias de codigo aberto!"
arch=('any')
url="https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-"
license=('GPL-3.0-or-later') # Licença SPDX oficial para GPLv3
install="$pkgname.install" # <--- Importante: Garante que o script .install seja executado

depends=('python' 'python-pip' 'base') # Dependências mínimas para venv e pip
makedepends=()

# O tarball contém navegador.py, e o ícone/desktop estão no mesmo diretório do PKGBUILD.
source=(
  "0.0.2.tar.gz::https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/archive/refs/tags/0.0.2.tar.gz"
  "navegadorpytechicon.png::https://github.com/pedrodev2025/Navegador-B-sico-E-Leve-Com-Python-/releases/download/0.0.1/navegadorpytechicon.png"       # Adicionado aqui, pois está local e precisa ir para $srcdir
  "navegadorpytechdesktop.desktop" # Adicionado aqui, pois está local e precisa ir para $srcdir
)
# GERE ESSES CHECKSUMS COM `updpkgsums` após salvar este PKGBUILD e ter todos os arquivos.
# Por enquanto, use 'SKIP'.
sha256sums=('SKIP' # para 0.0.1.tar.gz
            'SKIP' # para navegadorpytechicon.png
            'SKIP') # para navegadorpytechdesktop.desktop

build() {
  echo "Não há fase de build separada para este pacote Python."
}

package() {
  set -ex # Ativa o modo de depuração e saída em caso de erro na fase package()

  # O nome da pasta descompactada do tarball
  _extracted_dir="Navegador-B-sico-E-Leve-Com-Python--$pkgver"

  # Cria o diretório de instalação em /opt/
  mkdir -p "$pkgdir/opt/$pkgname" # Padroniza para /opt/navegadorpytech/
  mkdir -p "$pkgdir/opt/$pkgname/venv" # Cria a pasta do venv no pacote

  # Copia o script principal navegador.py do diretório descompactado do tarball
  install -Dm755 "$srcdir/${_extracted_dir}/navegador.py" "$pkgdir/opt/$pkgname/navegador.py"

  # Instala o ícone
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
  install -m644 "$srcdir/navegadorpytechicon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png" # Renomeia para pkgname.png por convenção

  # Instala o desktop file
  mkdir -p "$pkgdir/usr/share/applications/"
  install -m644 "$srcdir/navegadorpytechdesktop.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop" # Renomeia para pkgname.desktop por convenção

  # Cria o script wrapper em /usr/bin/
  mkdir -p "$pkgdir/usr/bin/"
  cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/bash
/opt/navegadorpytech/venv/bin/python /opt/navegadorpytech/navegador.py "$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
