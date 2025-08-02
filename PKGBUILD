# Maintainer: Pedro Lucas <pedrolucasinvestidor.github@gmail.com>

pkgname=downtube
pkgver=1.1
pkgrel=1
pkgdesc="O Downtube é um downloader de vídeos do YouTube, minimalista, simples, rápido."
# 'any' é apropriado para aplicativos Node.js puros.
arch=('any')
url="https://github.com/pedrodev2025/Downtube" # Sem .git no final para a URL do projeto
license=('MIT') # Use um identificador SPDX válido

# Dependências de tempo de execução.
# yt-dlp é uma dependência externa que o downtube provavelmente usa.
depends=('nodejs' 'npm' 'yt-dlp')
# Dependências de tempo de compilação.
# git é necessário para clonar o repositório.
makedepends=('git')

# Fonte do pacote. Use o URL do repositório Git.
# O makepkg clonará automaticamente o repositório para $srcdir.
source=("git+$url.git")
# Checksums para as fontes. Se você estiver clonando um repositório Git, use 'SKIP'.
# Para releases tarball, você precisaria de um checksum real.
sha256sums=('SKIP') # OK para repositórios Git, mas para releases fixas, use o checksum real.

# Arquivo de instalação para ações pós-instalação/remoção.
install=${pkgname}.install

# A função build() é onde você compila e prepara seu aplicativo.
build() {
  # Entra no diretório da fonte, que é $srcdir/$pkgname (ou $srcdir/Downtube se o nome do repo for diferente)
  # O makepkg clonará o repositório para $srcdir/Downtube (nome do repositório)
  cd "$srcdir/Downtube"

  echo "Instalando dependências do Node.js..."
  # Instala as dependências do Node.js listadas no package.json
  npm install --production # --production para instalar apenas dependências de produção
}

# A função package() é onde você instala os arquivos no diretório do pacote ($pkgdir).
package() {
  # Entra no diretório da fonte onde as dependências foram instaladas
  cd "$srcdir/Downtube"

  # Cria o diretório para o aplicativo Node.js em /usr/share/downtube
  # Aplicativos Node.js geralmente vão para /usr/share ou /opt
  mkdir -p "$pkgdir/usr/share/$pkgname"

  # Copia todos os arquivos do projeto Node.js para o diretório de instalação
  cp -r . "$pkgdir/usr/share/$pkgname/"

  # Cria o diretório para a unidade systemd
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  # Copia o arquivo de serviço para o local correto
  # Certifique-se de que 'downtube.service' esteja na raiz do seu repositório Git.
  install -m644 downtube.service "$pkgdir/usr/lib/systemd/system/"

  # Removida a criação do script helper em /usr/bin/downtube conforme solicitado.
  # O utilizador precisará iniciar o aplicativo via systemd ou manualmente com 'node /usr/share/downtube/archives/server.js'
}
