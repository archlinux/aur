# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>
# Contributor: Steve Engledow <steve@engledow.me>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=aws-cli-v2-bin
# https://github.com/aws/aws-cli/raw/v2/CHANGELOG.rst
pkgver=2.18.16
pkgrel=1
epoch=2
pkgdesc='Unified command line interface for Amazon Web Services (version 2) (binary release)'
arch=(x86_64 aarch64)
url='https://github.com/aws/aws-cli/tree/v2'
license=('Apache')
options=(!strip !debug)
makedepends=('unzip')
depends=('less')
optdepends=()
provides=(aws-cli)
conflicts=(aws-cli aws-cli-v2)
install=aws-cli-v2-bin.install

source=("aws_bash_completer::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/bin/aws_bash_completer"
        "aws_zsh_completer.sh::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/bin/aws_zsh_completer.sh"
		"LICENSE.txt::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/LICENSE.txt")

sha256sums=('451a681062516a0473c8764a6593b0a65b6e558bf6128899b1d5e19b258f679e'
            '426e99f1e8cd00cce9263693d29ceac5b4834f6cf1766cd57b985a440eea2e87'
			'a395e1165c2ed0e2bf041ae28e528245aedd4009b7e94ad407780257f704afc1')

source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://awscli.amazonaws.com/awscli-exe-linux-aarch64-${pkgver}.zip)

sha256sums_x86_64=('6a9a3dac4d287363429206180999410794be1ea4e66139432312e12a8c4aa111')
sha256sums_aarch64=('56dbe3ad9f482219416b7de305347f96bc851e7611ad287746aecf7f94e761ec')
validpgpkeys=(
  'FB5DB77FD5C118B80511ADA8A6310ACC4672475C'  # the key mentioned on https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
)

package() {
	# Create the install dir and move the binary files there
	mkdir -p $pkgdir/usr/local/aws-cli
  	mv aws/dist $pkgdir/usr/local/aws-cli/v2

	# Install completions scripts
	install -Dm644 aws_bash_completer $pkgdir/usr/share/bash-completion/completions/aws
	install -Dm644 aws_zsh_completer.sh $pkgdir/usr/bin/aws_zsh_completer.sh
	
	# Install license
	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# aws and aws_completer symlinks to /usr/bin
	ln -sf /usr/local/aws-cli/v2/aws $pkgdir/usr/bin/aws
	ln -sf /usr/local/aws-cli/v2/aws_completer $pkgdir/usr/bin/aws_completer
}
