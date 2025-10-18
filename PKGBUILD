# Maintainer: Nick Syntychakis <nsyntych@punkops.dev>

pkgname=aws-cli-bin
# https://github.com/aws/aws-cli/raw/v2/CHANGELOG.rst
pkgver=2.31.18
pkgrel=1
epoch=1
pkgdesc='Unified command line interface for Amazon Web Services (Amazon provided v2 binary release)'
arch=(x86_64 aarch64)
url='https://github.com/aws/aws-cli/tree/v2'
license=('Apache-2.0')
options=(!strip !debug)
makedepends=('unzip')
depends=('less')
optdepends=()
provides=(aws-cli)
conflicts=(aws-cli aws-cli-v2 aws-cli-v2-bin aws-cli-git)
install=aws-cli-v2-bin.install

source=("aws_bash_completer::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/bin/aws_bash_completer"
        "aws_zsh_completer.sh::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/bin/aws_zsh_completer.sh"
		"LICENSE.txt::https://raw.githubusercontent.com/aws/aws-cli/${pkgver}/LICENSE.txt")

sha256sums=('451a681062516a0473c8764a6593b0a65b6e558bf6128899b1d5e19b258f679e'
            '426e99f1e8cd00cce9263693d29ceac5b4834f6cf1766cd57b985a440eea2e87'
			'9b3a0d5c384b013bfc56f2f265afdbbe5c2fb674b1d6ee54190d235f284a1af0')

source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${pkgver}.zip)
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://awscli.amazonaws.com/awscli-exe-linux-aarch64-${pkgver}.zip)

sha256sums_x86_64=('4a1257f6eca864dcdee1b98e29e9428466ed365398c50032ddf5e4b4d3728e32')
sha256sums_aarch64=('a9ba558297d736a121183a3ca0073a51e949e576668b9aff33cc7fd88044811d')
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
