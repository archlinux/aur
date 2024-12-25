Include <stdlib.h> for !USE_MMALLOC, so that the malloc etc.
prototypes are available.  For C99 compatibility.

This seems to have been fixed in <https://github.com/ingwarsw/tinyfugue>
in a different way.

diff --git a/src/malloc.h b/src/malloc.h
index cc4d3bf317b09b06..2e649de2651c1edf 100644
--- a/src/malloc.h
+++ b/src/malloc.h
@@ -34,6 +34,7 @@ extern int low_memory_warning;
 # define realloc(ptr, size)		mrealloc(NULL, ptr, size)
 # define free(ptr)			mfree(NULL, ptr)
 #else
+# include <stdlib.h>
 # define mmalloc(md, size)		malloc(size)
 # define mcalloc(md, size)		calloc(size)
 # define mrealloc(md, ptr, size)	realloc(ptr, size)
