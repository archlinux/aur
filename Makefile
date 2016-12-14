



PHOHY = clean release

BASEURL:=http://storage.googleapis.com/kubernetes-release/release


check:
ifndef VERSION
	@echo "Define version in ENV"
	@exit 1;
else
	@echo "Build version ${VERSION}"
endif


test:
	set -e ;\
	MD5=`curl -s https://s3-eu-west-1.amazonaws.com/foodie-devops/ec2init.sh|md5sum`; \
	echo $${MD5}; \

prepare: check
	@mkdir -p tmp
	@curl -s ${BASEURL}/v${VERSION}/bin/linux/amd64/kubectl > tmp/kubectl_amd64
	@curl -s ${BASEURL}/v${VERSION}/bin/linux/386/kubectl > tmp/kubectl_386

release: prepare
	set -e; \
	MD5_AMD64=`md5sum tmp/kubectl_amd64 | awk '{print $$1}'`; \
	MD5_386=`md5sum tmp/kubectl_386 | awk '{print $$1}'`; \
	sed -i.bak -r -e "s/md5sums_i686=.*/md5sums_i686=('$${MD5_386}')/g" \
        -e "s/md5sums_x86_64=.*/md5sums_x86_64=('$${MD5_AMD64}')/g" PKGBUILD; \
	makepkg --printsrcinfo > .SRCINFO; \
	makepkg; \
	sudo pacman -U kubectl-bin*; \


clean:
	rm -rf kubectl-* pkg src *.bak tmp
