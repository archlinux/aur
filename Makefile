VER=0.0.1-1

build:
	tar cvf $(VER).tar.gz larryshell larryshellrc larryshell-errors.txt
	md5sum $(VER).tar.gz
	cp $(VER).tar.gz /srv/http/larryshell
clean:
	rm -r src pkg *.tar*
