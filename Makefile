PREFIX ?= /usr/local

install:
	mkdir -p ${DESTDIR}${PREFIX}/share/anki
	cp -av * ${DESTDIR}${PREFIX}/share/anki/
	mkdir -p ${DESTDIR}${PREFIX}/bin
	ln -sf ${PREFIX}/share/anki/bin/anki ${DESTDIR}${PREFIX}/bin/
	# fix a previous packaging issue where we created this as a file
	(test -f ${DESTDIR}${PREFIX}/share/applications && rm ${DESTDIR}${PREFIX}/share/applications)||true
	mkdir -p ${DESTDIR}${PREFIX}/share/pixmaps
	mkdir -p ${DESTDIR}${PREFIX}/share/applications
	mkdir -p ${DESTDIR}${PREFIX}/share/man/man1
	cd ${DESTDIR}${PREFIX}/share/anki && (\
	mv anki.xpm anki.png ${DESTDIR}${PREFIX}/share/pixmaps/;\
	mv anki.desktop ${DESTDIR}${PREFIX}/share/applications/;\
	mv anki.1 ${DESTDIR}${PREFIX}/share/man/man1/)
	#install -Dm644 anki.xml ${DESTDIR}/usr/share/mime/packages/anki.xml
	#xdg-mime default anki.desktop application/x-anki
	#xdg-mime default anki.desktop application/x-apkg
