# Maintainer: Security XIII <securityxiii at gmail dot com>
pkgname=nanominer-cuda
pkgver=3.4.1
pkgrel=1
pkgdesc="nanopool mining software"
arch=('any')
depends=('pciutils' 'bash')
license=('custom:nanopool')
conflicts=('nanominer')
install=$pkgname-cuda.install
url='https://github.com/nanopool/nanominer/releases'
sha256sums=("b038ab5fec9a05dc8c2cdcdf523b59f158545ca82d2cc458dbd63e2c3163c03e"
			"SKIP")

prepare() {
        mv nanominer-linux-$pkgver-cuda11 nanominer-cuda-linux-3.4.1
	cd $pkgname-linux-$pkgver
	
	# copies config files in config_examples
	mkdir -p config_examples
	for FILE in config*.ini
	do
		cp -R $FILE ./config_examples/$FILE	
	done

	# Avoids erasing existing config files to avoid erasing any user settings
	for FILE in $pkgdir/opt/$pkgname/config*.ini
	do
		FILENAME=${FILE##*/}
		for SRCFILE in config*.ini
		do
			if [ $FILENAME==$SRCFILE  ]
			then
				rm $SRCFILE
			fi
		done
	done
}

source=("https://github.com/nanopool/nanominer/releases/download/v$pkgver/nanominer-linux-$pkgver-cuda11.tar.gz"
		"https://github.com/nanopool/nanominer/raw/master/Terms%20of%20Use%20Nanominer.pdf")

package() {

	# Launcher
	echo -e "#\!/bin/bash\ncd /opt/nanominer\nexec /opt/$pkgname/nanominer \$*" > nanominer.sh  
	install -Dm755 nanominer.sh "$pkgdir"/usr/bin/nanominer

	# License
	install -Dm644 Terms%20of%20Use%20Nanominer.pdf "$pkgdir"/usr/share/licenses/"$pkgname"/TOU_Nanominer.pdf

	# Install
	mkdir -p $pkgdir/opt/"$pkgname" 
	cp -R "$pkgname-linux-$pkgver"/* $pkgdir/opt/"$pkgname" 
}
