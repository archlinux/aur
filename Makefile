# Maintainer: Richard Moe <aur@stuffandjunk.org>

PHOHY = clean release
BASEURL:=https://github.com/yt-dlp/yt-dlp/releases/download/

check:
ifndef VERSION
	@echo "Getting latest version from GitHub"

else
	@echo "Build version ${VERSION}"
endif


prepare: check
	@mkdir -p tmp

	# Download the files
	curl -L -s ${BASEURL}/${VERSION}/yt-dlp_linux > tmp/yt-dlp_linux
	curl -L -s ${BASEURL}/${VERSION}/yt-dlp_linux_aarch64 > tmp/yt-dlp_linux_aarch64
	curl -L -s ${BASEURL}/${VERSION}/SHA2-256SUMS > tmp/SHA2-256SUMS
	curl -L -s ${BASEURL}/${VERSION}/SHA2-256SUMS.sig > tmp/SHA2-256SUMS.sig
	curl -L -s https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/public.key > tmp/public.key

	# Import into temporary keyring
	@gpg --quiet --no-default-keyring --keyring ./tmp/pubring.gpg --import tmp/public.key

    # Validate the signature

	@gpg --quiet --keyring ./tmp/pubring.gpg --verify tmp/SHA2-256SUMS.sig tmp/SHA2-256SUMS
	if [ $$? -ne 0 ]; then \
		@echo "Signature verification failed"; \
		exit 1; \
	fi
	# Validate the checksums
	cd tmp && sha256sum --ignore-missing -c SHA2-256SUMS
	if [ $$? -ne 0 ]; then \
		@echo "Checksum verification failed"; \
		exit 1; \
	fi
	chmod +x tmp/yt-dlp_linux tmp/yt-dlp_linux_aarch64
release: prepare
	set -e; \
	SHA256_AMD64=`sha256sum tmp/yt-dlp_linux | awk '{print $$1}'`; \
	SHA256_ARM64=`sha256sum tmp/yt-dlp_linux_aarch64 | awk '{print $$1}'`; \
	sed -i.bak -r -e "s/pkgver=.*/pkgver=$${VERSION}/g" \
        -e "s/sha256sums_x86_64=.*/sha256sums_x86_64=('$${SHA256_AMD64}')/g" \
        -e "s/sha256sums_aarch64=.*/sha256sums_aarch64=('$${SHA256_ARM64}')/g" PKGBUILD; \
	makepkg --printsrcinfo > .SRCINFO; \
	makepkg; \
	sudo pacman -U yt-dlp-bin-${VERSION}-1-x86_64.pkg.tar.zst

clean:
	rm -rf yt-dlp* pkg src *.bak tmp
