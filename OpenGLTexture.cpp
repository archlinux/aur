//  Friking Shark, a Flying Shark arcade remake.
//  Copyright (C) 2011  Javier Martin Garcia (javiermartingarcia@gmail.com)
//	
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//  
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//  



#include "./stdafx.h"
#include <stdint.h>
#include "OpenGLGraphics.h"
#include "OpenGLTexture.h"
#define PNG_SKIP_SETJMP_CHECK
#define PNG_NO_PEDANTIC_WARNINGS
#include <libpng14/png.h>

#pragma pack(push,1)
struct BMPFILEHEADER
{
	uint16_t bfType; 
	uint32_t bfSize; 
	uint16_t bfReserved1; 
	uint16_t bfReserved2; 
	uint32_t bfOffBits; 
};
struct BMPINFOHEADER 
{ 
	uint32_t biSize; 
	uint32_t biWidth; 
	uint32_t biHeight; 
	uint16_t biPlanes; 
	uint16_t biBitCount;
	uint32_t biCompression; 
	uint32_t biSizeImage; 
	uint32_t biXPelsPerMeter; 
	uint32_t biYPelsPerMeter; 
	uint32_t biClrUsed; 
	uint32_t biClrImportant; 
}; 
#pragma pack(pop)

bool LoadBMPFile(const char *pFileName,unsigned int nBits,unsigned int *pnWidth,unsigned int *pnHeight,unsigned char **ppPixels)
{
	BMPFILEHEADER fileHeader={0};
	BMPINFOHEADER fileInfo={0};

	FILE *pFile=fopen(pFileName,"rb");
	if(!pFile){return false;}
	// Make room for the header
	bool bOk=(fread(&fileHeader,sizeof(fileHeader),1,pFile)==1);
	if(bOk){bOk=(fileHeader.bfType == 0x4d42);}
	if(bOk){bOk=(fread(&fileInfo,sizeof(fileInfo),1,pFile)==1);}
	if(bOk){bOk=(fileInfo.biSize==sizeof(fileInfo));}
	if(bOk){bOk=(fileInfo.biPlanes==1);}
	if(bOk){bOk=(fileInfo.biBitCount==24 || fileInfo.biBitCount==32);}
	if(bOk){bOk=(fileInfo.biCompression==0);} // BI_RGB
	if(bOk){fseek(pFile,fileHeader.bfOffBits,SEEK_SET);}
	if(bOk)
	{
		unsigned char *pFileBits=(unsigned char*)malloc(fileInfo.biSizeImage);
		if(bOk){bOk=(fread(pFileBits,fileInfo.biSizeImage,1,pFile)==1);}
		if(bOk)
		{
			*pnHeight=fileInfo.biHeight;
			*pnWidth=fileInfo.biWidth;
			*ppPixels = new unsigned char[fileInfo.biHeight * fileInfo.biWidth * nBits/8];
			// Set alpha to 1
			if(nBits==32){memset(*ppPixels,0xFF,fileInfo.biHeight * fileInfo.biWidth * nBits/8);}

			int sourceLineSize = fileInfo.biWidth *  fileInfo.biBitCount/8;
			int paddedLineSize = ((sourceLineSize/4)*4);
			int pad=0;
			if(paddedLineSize < sourceLineSize){pad=4;}

			unsigned char *bufferPointer = (*ppPixels);// + (lineSize * (fileInfo.biHeight-1));
			unsigned char *imagePointer = pFileBits;

			int x, y;
			int nSourceExcess=fileInfo.biBitCount>nBits?1:0;
			int nDestExcess=nBits>fileInfo.biBitCount?1:0;
			int nCommon=fileInfo.biBitCount==nBits?fileInfo.biBitCount/8:3;

			for(x = fileInfo.biHeight-1; x >= 0; x--)
			{
				for(y = 0; y < (int)fileInfo.biWidth; y++)
				{
					bufferPointer[0] = imagePointer[2];
					bufferPointer[1] = imagePointer[1];
					bufferPointer[2] = imagePointer[0];
					bufferPointer+=nCommon+nDestExcess;
					imagePointer+=nCommon+nSourceExcess;
				}
				imagePointer  += pad;
			}
		}
		free(pFileBits);
		pFileBits=NULL;
	}

	fclose(pFile);
	pFile=NULL;
	return bOk;
}

bool LoadPngFile(const char *pFileName,unsigned int nBits,unsigned int *pnWidth,unsigned int *pnHeight,unsigned char **ppPixels)
{
	png_structp pPNGHeader=NULL;
	png_infop pPNGInfo=NULL;

	bool bOk;
	FILE *pFile=fopen(pFileName,"rb");
	bOk=(pFile!=NULL);
	if(bOk){pPNGHeader=png_create_read_struct(PNG_LIBPNG_VER_STRING,NULL,NULL,NULL);bOk=(pPNGHeader!=NULL);}
	if(bOk){pPNGInfo=png_create_info_struct(pPNGHeader);bOk=(pPNGInfo!=NULL);}
	if(bOk){bOk=(setjmp(png_jmpbuf(pPNGHeader))==0);}
	if(bOk){png_init_io(pPNGHeader, pFile);}
	if(bOk){png_set_sig_bytes(pPNGHeader, 0);}
	if(bOk){png_read_png(pPNGHeader, pPNGInfo, PNG_TRANSFORM_STRIP_16 | PNG_TRANSFORM_PACKING | PNG_TRANSFORM_EXPAND, NULL);}
	if(bOk){bOk=(pPNGInfo->color_type==PNG_COLOR_TYPE_RGBA || pPNGInfo->color_type==PNG_COLOR_TYPE_RGB);}
	if(bOk)
	{
		*pnWidth= pPNGInfo->width;
		*pnHeight= pPNGInfo->height;
		unsigned int nFileBits=pPNGInfo->color_type==PNG_COLOR_TYPE_RGBA?32:24;
		unsigned int nRequestedBits=(nBits==GL_RGBA)?32:24;
	
		if(nFileBits==nRequestedBits)
		{
			unsigned int nRowSize = png_get_rowbytes(pPNGHeader, pPNGInfo);
			*ppPixels = new unsigned char [nRowSize* pPNGInfo->height];
			png_bytepp ppRows = png_get_rows(pPNGHeader, pPNGInfo);
			for(unsigned int y=0;y<pPNGInfo->height;y++) 
			{
				memcpy(*ppPixels+(nRowSize* (pPNGInfo->height-1-y)), ppRows[y], nRowSize);
			}
		}
		else
		{
			int nDestBytesPerColor=(nRequestedBits>>3);
			int nFileBytesPerColor=(nFileBits>>3);
			
			png_get_rowbytes(pPNGHeader, pPNGInfo);
			unsigned int nDestRowSize = nDestBytesPerColor*pPNGInfo->width;
			*ppPixels = new unsigned char [nDestBytesPerColor*pPNGInfo->width*pPNGInfo->height];

			if(nDestBytesPerColor>nFileBytesPerColor)
			{
				// Alpha channel to full opacity if missing.
				memset(*ppPixels,255,nDestBytesPerColor*pPNGInfo->width*pPNGInfo->height);
			}
		
			png_bytepp ppRows = png_get_rows(pPNGHeader, pPNGInfo);
			for(unsigned int y=0;y<pPNGInfo->height;y++) 
			{
				unsigned char *pFile=ppRows[y];
				unsigned char *pDest=(*ppPixels)+(nDestRowSize* (pPNGInfo->height-1-y));
				
				for(unsigned int x=0;x<pPNGInfo->width;x++) 
				{
					pDest[0]=pFile[0];
					pDest[1]=pFile[1];
					pDest[2]=pFile[2];
					pDest+=nDestBytesPerColor;
					pFile+=nFileBytesPerColor;
				}
			}
		}
	}

	if(pPNGHeader){png_destroy_read_struct(&pPNGHeader, &pPNGInfo,NULL);}
	if(pFile){fclose(pFile);}	
	return bOk;	
}


bool LoadImageHelper(std::string sFile,unsigned int dwColorType,unsigned *pOpenGLSkinWidth,unsigned *pOpenGLSkinHeight,unsigned char **ppBuffer)
{
	*pOpenGLSkinWidth=0;
	*pOpenGLSkinHeight=0;
	*ppBuffer=NULL;

	char sFileName[MAX_PATH]={0};
	strcpy(sFileName,sFile.c_str());

	char sExt[MAX_PATH]={0};
	GetExtension(sFile.c_str(),sExt);

	std::string path=sFile;
	char pFileFolder[MAX_PATH];
	GetFileFolder(sFileName,pFileFolder);
	if(pFileFolder[0]==0 || strcmp(pFileFolder,".")==0)
	{
		std::string sTemp="Textures/";
		sTemp+=path;
		path=sTemp;
	}
	if(sExt[0]==0)
	{
		path+=".bmp";
	}
	else
	{
		if(strcasecmp(sExt,".PNG")==0)
		{
			return LoadPngFile(path.c_str(),dwColorType,pOpenGLSkinWidth,pOpenGLSkinHeight,ppBuffer);
		}
	}
	return LoadBMPFile(path.c_str(),(dwColorType==GL_RGBA)?32:24,pOpenGLSkinWidth,pOpenGLSkinHeight,ppBuffer);
}


COpenGLTexture::COpenGLTexture(void)
{
	m_bDepth=false;
	m_bRenderTarget=false;
	m_dwWidth=0;
	m_dwHeight=0;
	m_pBuffer=NULL;

	m_bColorKey=false;
	m_fOpacity=1.0;

	m_nTextureIndex=0;
	m_nFrameBuffer=0;
	m_nFrameBufferDepth=0;

#ifdef WIN32
	m_hPBufferDC=NULL;
	m_hPBufferRC=NULL;
	m_nPBufferPixelFormatIndex=0;
	m_hPBuffer=NULL;

	m_hPBufferOldDC=NULL;
	m_hPBufferOldRC=NULL;
#endif
}

void COpenGLTexture::Clear()
{
	if(m_pBuffer)
	{
		delete [] m_pBuffer;
		m_pBuffer=NULL;
	}
	
#ifdef WIN32
	if(m_hPBufferRC){wglDeleteContext(m_hPBufferRC);m_hPBufferRC=NULL;}
	if(m_hPBufferDC){wglReleasePbufferDCARB(m_hPBuffer,m_hPBufferDC);m_hPBufferDC=NULL;}
	if(m_hPBuffer){wglDestroyPbufferARB(m_hPBuffer);m_hPBuffer=NULL;}
#endif

	if(m_nFrameBuffer)
	{
		glDeleteFramebuffersEXT(1,&m_nFrameBuffer);
		m_nFrameBuffer=0;
	}
	if(m_nFrameBufferDepth)
	{
		glDeleteRenderbuffersEXT(1,&m_nFrameBufferDepth);
		m_nFrameBufferDepth=0;
	}
	if(m_nTextureIndex)
	{
		glDeleteTextures(1,&m_nTextureIndex);
		m_nTextureIndex=0;
	}
}

COpenGLTexture::~COpenGLTexture(void)
{
	Clear();
}

std::string	COpenGLTexture::GetFileName(){return m_sFileName;}
bool		COpenGLTexture::HasAlphaFile(){return m_sAlphaFileName!="";}
std::string COpenGLTexture::GetAlphaFileName(){return m_sAlphaFileName;}
void		COpenGLTexture::GetSize(unsigned *pdwWidth,unsigned *pdwHeight){*pdwWidth=m_dwWidth;*pdwHeight=m_dwHeight;}
bool		COpenGLTexture::HasColorKey(){return m_bColorKey;}
CVector		COpenGLTexture::GetColorKey(){return m_vColorKey;}
bool COpenGLTexture::LoadFromFile()
{
	int nStartTime=GetTimeStamp();
  
	bool bResult=true;
	unsigned int	 dwColorType=HasAlphaChannel()?GL_RGBA:GL_RGB;

	if(LoadImageHelper(m_sFileName,dwColorType,&m_dwWidth,&m_dwHeight,&m_pBuffer))
	{
		if(m_sAlphaFileName!="")
		{
			unsigned char	*pAlphaBuffer=NULL;
			unsigned nAlphaOpenGLSkinWidth=0,nAlphaOpenGLSkinHeight=0;

			if(LoadImageHelper(m_sAlphaFileName,GL_RGB,&nAlphaOpenGLSkinWidth,&nAlphaOpenGLSkinHeight,&pAlphaBuffer))
			{
				if(nAlphaOpenGLSkinWidth==m_dwWidth && m_dwHeight==nAlphaOpenGLSkinHeight)
				{
					unsigned char *pTempBuffer=m_pBuffer;
					unsigned char *pTempAlpha=pAlphaBuffer;

					for(unsigned y=0; y < m_dwHeight; y++)
					{
						for(unsigned x = 0; x < m_dwWidth; x++,pTempBuffer+=4,pTempAlpha+=3)
						{
							pTempBuffer[3] = (unsigned char)((((unsigned int)pTempAlpha[0])+((unsigned int)pTempAlpha[1])+((unsigned int)pTempAlpha[2]))/3);
						}
					}
				}
				else
				{
					bResult=false;
					RTTRACE("COpenGLTexture::LoadFromFile -> Texture %s size does not match with alpha texture %s",m_sFileName.c_str(),m_sAlphaFileName.c_str());
				}
			}
			else
			{
				bResult=false;
				RTTRACE("COpenGLTexture::LoadFromFile -> Failed to load alpha texture %s",m_sAlphaFileName.c_str());
			} 
			if(pAlphaBuffer){delete [] pAlphaBuffer;pAlphaBuffer=NULL;}
		}	
		else if(m_bColorKey)
		{
			unsigned char red=(unsigned char)(m_vColorKey.c[0]*255.0);
			unsigned char green=(unsigned char)(m_vColorKey.c[1]*255.0);
			unsigned char blue=(unsigned char)(m_vColorKey.c[2]*255.0);

			unsigned char *pTempBuffer=m_pBuffer;

			for(unsigned y=0; y < m_dwHeight; y++)
			{
				for(unsigned x = 0; x < m_dwWidth; x++,pTempBuffer+=4)
				{
					pTempBuffer[3] = (pTempBuffer[0]==red && pTempBuffer[1]==green && pTempBuffer[2]==blue)?0:255;
				}
			}
		}
		else if(m_fOpacity<1.0)
		{
			unsigned char *pTempBuffer=m_pBuffer;

			for(unsigned int y=0; y < m_dwWidth; y++)
			{
				for(unsigned int x = 0; x < m_dwHeight; x++,pTempBuffer+=4)
				{
					pTempBuffer[3] = (unsigned char)(255.0*m_fOpacity);
				}
			}
		}
	}
	else
	{
		bResult=false;
	}
	
	if(bResult)
	{
		glGenTextures(1,&m_nTextureIndex);

		if(m_nTextureIndex)
		{
			glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
			glTexEnvi(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_MODULATE);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST_MIPMAP_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
			gluBuild2DMipmaps(GL_TEXTURE_2D,dwColorType==GL_RGBA?4:3,m_dwWidth,m_dwHeight,dwColorType,GL_UNSIGNED_BYTE,m_pBuffer);
		}
		m_bRenderTarget=false;
		
		RTTRACE("COpenGLTexture::LoadFromFile -> Loaded texture %s (%d ms)",m_sFileName.c_str(),GetTimeStamp()-nStartTime);
	}
	else
	{
		RTTRACE("COpenGLTexture::LoadFromFile -> Failed to load texture %s",m_sFileName.c_str());
	}

	return bResult;
}

bool COpenGLTexture::Unserialize(ISystemPersistencyNode *piNode)
{
	bool bResult=CSystemObjectBase::Unserialize(piNode);
	if(bResult){bResult=LoadFromFile();}
	return bResult;
}
bool COpenGLTexture::HasAlphaChannel(){return (m_bColorKey || m_sAlphaFileName!="" || m_fOpacity<=1.0 || m_bRenderTarget);}

unsigned long COpenGLTexture::GetByteBufferLength(){return HasAlphaChannel()?m_dwHeight*m_dwWidth*4:m_dwHeight*m_dwWidth*3;}
void		  *COpenGLTexture::GetByteBuffer(){return m_pBuffer;}

bool COpenGLTexture::Load(std::string sFileName,CVector *pColorKey,std::string *pAlphaFile,float fOpacity)
{
	Clear();

	m_sFileName=sFileName;
	m_sAlphaFileName=pAlphaFile?*pAlphaFile:"";
	m_bColorKey=false;
	m_fOpacity=fOpacity;
	if(pColorKey)
	{
		m_vColorKey=*pColorKey;
		m_bColorKey=true;
	}
	if(m_pBuffer)
	{
		delete [] m_pBuffer;
		m_pBuffer=NULL;
	}
	return LoadFromFile();
}

CVector COpenGLTexture::GetPixelColor( unsigned long x, unsigned long y )
{
	CVector vResult;
	if(x<m_dwWidth && y<m_dwHeight)
	{
		unsigned long nPixel=x+(y*m_dwWidth);
		unsigned long nPixelSize=(HasAlphaChannel()?4:3);
		unsigned char *pPixel=m_pBuffer+(nPixel*nPixelSize);
		for(int p=0;p<3;p++){vResult.c[p]=((double)pPixel[p])/255.0;}		 
	}
	return vResult;
}

double COpenGLTexture::GetPixelAlpha( unsigned long x, unsigned long y )
{
	if(!HasAlphaChannel()){return m_fOpacity;}
	if(x<m_dwWidth && y<m_dwHeight)
	{
		unsigned long nPixel=x+(y*m_dwWidth);
		unsigned long nPixelSize=4;
		unsigned char *pPixel=m_pBuffer+(nPixel*nPixelSize);
		return ((double)pPixel[3])/255.0;
	}
	return m_fOpacity;
}

bool COpenGLTexture::CreateFrameBuffer(bool bDepth)
{
	// FrameBuffer Implementation
	
	glGenTextures(1,&m_nTextureIndex);
	if(!bDepth)
	{
		glGenRenderbuffersEXT(1, &m_nFrameBufferDepth);
	}
	glGenFramebuffersEXT(1,&m_nFrameBuffer);

	if(m_nTextureIndex && m_nFrameBuffer && (m_nFrameBufferDepth|| bDepth))
	{
		m_bRenderTarget=true;

		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
		if(bDepth)
		{
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,  GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER,  GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
			glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_FALSE);
			glTexImage2D(GL_TEXTURE_2D, 0,  GL_DEPTH_COMPONENT, m_dwWidth,m_dwHeight, 0, GL_DEPTH_COMPONENT, GL_FLOAT, 0);
		}
		else
		{
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
			glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_FALSE);
			glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_dwWidth,m_dwHeight, 0,GL_RGBA, GL_UNSIGNED_BYTE, 0);
		}
		glBindTexture(GL_TEXTURE_2D, 0);

		glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, m_nFrameBufferDepth);
		glRenderbufferStorageEXT(GL_RENDERBUFFER_EXT, GL_DEPTH_COMPONENT, m_dwWidth, m_dwHeight);
		glBindRenderbufferEXT(GL_RENDERBUFFER_EXT, 0);
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,m_nFrameBuffer);
		if(!bDepth)
		{		
			glFramebufferTexture2DEXT(GL_FRAMEBUFFER_EXT,GL_COLOR_ATTACHMENT0_EXT,GL_TEXTURE_2D,m_nTextureIndex,0);
			glFramebufferRenderbufferEXT(GL_FRAMEBUFFER_EXT, GL_DEPTH_ATTACHMENT_EXT,GL_RENDERBUFFER_EXT, m_nFrameBufferDepth);
		}
		else
		{
			glDrawBuffer(GL_NONE);
			glReadBuffer(GL_NONE);
			glFramebufferTexture2DEXT(GL_FRAMEBUFFER_EXT, GL_DEPTH_ATTACHMENT_EXT,GL_TEXTURE_2D, m_nTextureIndex, 0);
		}

		GLenum status = glCheckFramebufferStatusEXT(GL_FRAMEBUFFER_EXT);
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,0);
		return (status == GL_FRAMEBUFFER_COMPLETE_EXT);
	}
	else
	{
		return false;
	}
}
bool COpenGLTexture::CreateBackBuffer(bool bDepth,IGenericViewport *piViewport)
{
	bool bOk=true;
	// BackBuffer Implementation
	glGenTextures(1,&m_nTextureIndex);
	bOk=(m_nTextureIndex!=0);
	if(bOk)
	{
		SVideoMode mode;
		piViewport->GetCurrentVideoMode(&mode);
		
		while(m_dwWidth>(mode.w/2)){m_dwWidth/=2;}
		while(m_dwHeight>(mode.h/2)){m_dwHeight/=2;}
		m_bRenderTarget=true;

		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
		if(bDepth)
		{
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER,  GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER,  GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP);
			glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_FALSE);
			
			do
			{
				glTexImage2D(GL_TEXTURE_2D, 0,  GL_DEPTH_COMPONENT, m_dwWidth,m_dwHeight, 0, GL_DEPTH_COMPONENT, GL_FLOAT, 0);
				bOk=(glGetError()==GL_NO_ERROR);
				if(!bOk)
				{
					m_dwWidth/=2;m_dwHeight/=2;
				}
			}
			while(!bOk && (m_dwWidth>1 || m_dwHeight>1));
		}
		else
		{
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
			glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
			glTexParameteri(GL_TEXTURE_2D, GL_GENERATE_MIPMAP, GL_FALSE);
			do
			{
				glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, m_dwWidth,m_dwHeight, 0,GL_RGBA, GL_UNSIGNED_BYTE, 0);
				bOk=(glGetError()==GL_NO_ERROR);
				if(!bOk){m_dwWidth/=2;m_dwHeight/=2;}
			}
			while(!bOk && (m_dwWidth>1 || m_dwHeight>1));
		}
		glBindTexture(GL_TEXTURE_2D, 0);
	}
	return bOk;
}

bool COpenGLTexture::CreatePBuffer(bool bDepth)
{
#ifdef WIN32
	if(bDepth){return false;}

	HDC   hdc=wglGetCurrentDC();
	HGLRC hrc=wglGetCurrentContext();

	PIXELFORMATDESCRIPTOR pixelFormat={0};
	pixelFormat.nSize		= sizeof(PIXELFORMATDESCRIPTOR);

	// se coge el formato de pixel mas adecuado con la descripcion anterior
	if(m_nPBufferPixelFormatIndex==0)
	{
		int pFormatTypes[]={WGL_DRAW_TO_PBUFFER_EXT,TRUE,WGL_BIND_TO_TEXTURE_RGBA_ARB,TRUE,0,0};
		int pFormats[1000]={0};
		UINT nFormats=0;

		wglChoosePixelFormatARB(hdc,pFormatTypes,NULL,1000,pFormats,&nFormats);

		int nMinDepthBits=1000;
		int nMaxDepthFormatIndex=-1;
		for(unsigned x=0;x<nFormats;x++)
		{
			DescribePixelFormat(hdc,pFormats[x],sizeof(PIXELFORMATDESCRIPTOR), &pixelFormat);
			if(	pixelFormat.cColorBits == GetDeviceCaps(hdc,BITSPIXEL) && pixelFormat.cAlphaBits!=0 && pixelFormat.cDepthBits<nMinDepthBits)
			{
				nMinDepthBits=pixelFormat.cDepthBits;
				nMaxDepthFormatIndex=pFormats[x];
			}
		}
		if(nMaxDepthFormatIndex!=-1)
		{
			m_nPBufferPixelFormatIndex=nMaxDepthFormatIndex;
			DescribePixelFormat(hdc,m_nPBufferPixelFormatIndex,sizeof(PIXELFORMATDESCRIPTOR), &pixelFormat);
			int pnAttribs[]={WGL_TEXTURE_FORMAT_ARB,WGL_TEXTURE_RGBA_ARB,WGL_TEXTURE_TARGET_ARB,WGL_TEXTURE_2D_ARB,0,0};
			int types[]={WGL_ACCELERATION_ARB,WGL_DRAW_TO_PBUFFER_ARB,0};
			int values[]={0,0,0};
			wglGetPixelFormatAttribivARB(hdc,m_nPBufferPixelFormatIndex,0,2,types,values);
			m_hPBuffer = wglCreatePbufferARB( hdc, m_nPBufferPixelFormatIndex, m_dwWidth,m_dwHeight, pnAttribs);
			if(m_hPBuffer){m_hPBufferDC = wglGetPbufferDCARB( m_hPBuffer );}
			if(m_hPBufferDC){m_hPBufferRC = wglCreateContext( m_hPBufferDC);}
		}
	}
	wglMakeCurrent(hdc,hrc);
	if(m_hPBufferRC)
	{
		wglShareLists(hrc,m_hPBufferRC);
	}
	if(m_hPBufferRC)
	{
		// setup mutitexture 1 for window buffer
		GLfloat bordercolor[]={1,1,1,1};
		glActiveTexture(GL_TEXTURE1_ARB);
		glEnable( GL_TEXTURE_2D );
		glGenTextures(1,&m_nTextureIndex);
		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
		glTexEnvi(GL_TEXTURE_ENV,GL_TEXTURE_ENV_MODE,GL_MODULATE);
		glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
		glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
		glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
		glTexParameterfv(GL_TEXTURE_2D, GL_TEXTURE_BORDER_COLOR, bordercolor);
		glActiveTexture(GL_TEXTURE0_ARB);
		glBindTexture(GL_TEXTURE_2D,0);

		return true;
	}
	else
	{
		return false;
	}
#else
	return false;
#endif
}

bool COpenGLTexture::Create( unsigned nWidth,unsigned nHeight,IGenericViewport *piViewport)
{
	Clear();

	int nMaxTextureSize=0;
	glGetIntegerv(GL_MAX_TEXTURE_SIZE,&nMaxTextureSize);
	if((int)m_dwWidth>nMaxTextureSize){m_dwWidth=nMaxTextureSize;}
	if((int)m_dwHeight>nMaxTextureSize){m_dwHeight=nMaxTextureSize;}

	m_sFileName="";
	m_sAlphaFileName="";
	m_bColorKey=false;
	m_fOpacity=1.0;
	m_dwWidth=nWidth;
	m_dwHeight=nHeight;
	m_bDepth=false;

	bool bOk=false;
	if(!bOk){bOk=CreateFrameBuffer(false);}
	if(!bOk){bOk=CreatePBuffer(false);}
	if(!bOk){bOk=CreateBackBuffer(false,piViewport);}
	if(!bOk){Clear();}
	return bOk;
}

bool COpenGLTexture::CreateDepth( unsigned nWidth,unsigned nHeight,IGenericViewport *piViewport)
{
	Clear();

	m_sFileName="";
	m_sAlphaFileName="";
	m_bColorKey=false;
	m_fOpacity=1.0;
	m_dwWidth=nWidth;
	m_dwHeight=nHeight;
	m_bDepth=true;

	bool bOk=false;
	/* Don't support Depth texture for now
	if(!bOk){bOk=CreateFrameBuffer(true);}
	if(!bOk){bOk=CreatePBuffer(true);}
	if(!bOk){bOk=CreateBackBuffer(true,piViewport);}
	if(!bOk){Clear();}
	*/
	return bOk;
}

bool COpenGLTexture::StartRenderingToTexture()
{
	// FrameBuffer Implementation
	if(m_nFrameBuffer)
	{
		glPushAttrib(GL_ALL_ATTRIB_BITS);
		glDisable(GL_SCISSOR_TEST);
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,m_nFrameBuffer);
		return true;
	}
	else if(m_bDepth && m_nFrameBufferDepth)
	{
		glPushAttrib(GL_ALL_ATTRIB_BITS);
		glDisable(GL_SCISSOR_TEST);
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,m_nFrameBufferDepth);
		return true;
	}
#ifdef WIN32
	// PBuffer Implementation
	else if(m_hPBufferRC)
	{
		m_hPBufferOldDC=wglGetCurrentDC();
		m_hPBufferOldRC=wglGetCurrentContext();

		wglMakeCurrent(m_hPBufferDC,m_hPBufferRC);
		return true;
	}
#endif
	else if(m_bDepth)
	{
		glPushAttrib(GL_ALL_ATTRIB_BITS);
		glDisable(GL_SCISSOR_TEST);
		glClear(GL_DEPTH_BUFFER_BIT);
		glColorMask(false,false,false,false);
		glDepthMask(true);
	}
	else
	{
		glPushAttrib(GL_ALL_ATTRIB_BITS);
		glDisable(GL_SCISSOR_TEST);
		glClear(GL_DEPTH_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
		glColorMask(true,true,true,true);
		glDepthMask(true);
	}
	return false;
}

void COpenGLTexture::StopRenderingToTexture()
{
#ifdef WIN32
	// PBuffer implementation
	if(m_hPBufferRC)
	{
		wglMakeCurrent(m_hPBufferOldDC,m_hPBufferOldRC);
		m_hPBufferOldDC=NULL;
		m_hPBufferOldRC=NULL;
	}
	else
#endif
	// FrameBuffer Implementation
	if(m_nFrameBuffer)
	{
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,0);
		glPopAttrib();
	}
	// FrameBuffer Implementation
	else if(m_bDepth && m_nFrameBufferDepth)
	{
		glBindFramebufferEXT(GL_FRAMEBUFFER_EXT,0);
		glPopAttrib();
	}
	else
	{
		int nPreviousTexture=0;
		glGetIntegerv(GL_TEXTURE_BINDING_2D,&nPreviousTexture);
		glBindTexture(GL_TEXTURE_2D, m_nTextureIndex);
		glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, m_dwWidth, m_dwHeight);
		glBindTexture(GL_TEXTURE_2D, nPreviousTexture);
		glPopAttrib();
	}
}

bool COpenGLTexture::PrepareTexture(IGenericRender *piRender,int nTextureLevel)
{
	bool bShader=piRender->IsRenderingWithShader();
#ifdef WIN32
	if(m_hPBuffer)
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glEnable(GL_TEXTURE_2D);}
		wglBindTexImageARB(m_hPBuffer,WGL_FRONT_LEFT_ARB);
	}
	else 
#endif
	if(m_nFrameBuffer)
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glEnable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
	}
	else if(m_nFrameBufferDepth)
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glEnable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
	}
	else
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glEnable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,m_nTextureIndex);
	}
	return true;
}

void COpenGLTexture::UnprepareTexture(IGenericRender *piRender,int nTextureLevel)
{
	bool bShader=piRender->IsRenderingWithShader();
#ifdef WIN32
	if(m_hPBuffer)
	{
		wglReleaseTexImageARB(m_hPBuffer,WGL_FRONT_LEFT_ARB);
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glDisable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,0);
	}
	else 
#endif
	if(m_nFrameBuffer)
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glDisable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,0);
	}
	else if(m_nFrameBufferDepth)
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glDisable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,0);
	}
	else
	{
		glActiveTexture(GL_TEXTURE0_ARB+nTextureLevel);
		if(!bShader){glDisable(GL_TEXTURE_2D);}
		glBindTexture(GL_TEXTURE_2D,0);
	}
}
