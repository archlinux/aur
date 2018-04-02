



PHOHY = clean release

VERSION:=0.12.0
BASEURL:=https://azuredraft.blob.core.windows.net/draft
URL_386:=${BASEURL}/draft-v${VERSION}-linux-386.tar.gz 
URL_AMD64:=${BASEURL}/draft-v${VERSION}-linux-amd64.tar.gz 

check:
ifndef VERSION
	@echo "Define version in ENV"
	@exit 1;
else
	@echo "Build version ${VERSION}"
endif


tmp:
	@mkdir -p tmp

tmp/draft_amd64-${VERSION}: tmp
	curl -s ${URL_AMD64} > tmp/draft_amd64-${VERSION}


tmp/draft_386-${VERSION}: tmp
	curl -s ${URL_386} > tmp/draft_386-${VERSION}

pkgbuild: tmp/draft_amd64-${VERSION} tmp/draft_386-${VERSION} PKGBUILD.template
	set -e; \
	echo ${URL_386}; \
	MD5_386=`md5sum tmp/draft_386-${VERSION} | awk '{print $$1}'`; \
	MD5_AMD64=`md5sum tmp/draft_amd64-${VERSION} | awk '{print $$1}'`; \
	sed -r -e "s#PKGVER#${VERSION}#g" \
         -e "s#URL_386#${URL_386}#g" \
         -e "s#URL_AMD64#${URL_AMD64}#g" \
         -e "s#MD5_386#$${MD5_386}#g" \
         -e "s#MD5_AMD64#$${MD5_AMD64}#g" PKGBUILD.template > PKGBUILD; \
	makepkg --printsrcinfo > .SRCINFO; \

release: pkgbuild
	makepkg; \
	sudo pacman -U draft-bin*; \

clean:
	rm -rf PKGBUILD draft-* pkg src *.bak tmp
